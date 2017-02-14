%% @author Maas-Maarten Zeeman <maas@channel.mel>
%% @copyright 2017 Maas-Maarten Zeeman
%% Date: 2017-02-10
%% @doc Simply publish your roadmap on your zotonic site.

%% Copyright 2017 Maas-Maarten Zeeman 
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%% 
%%     http://www.apache.org/licenses/LICENSE-2.0
%% 
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

-module(mod_roadmap).
-author("Maas-Maarten Zeeman <maas@channel.me>").

-mod_title("Publish your roadmap").
-mod_description("Manage and publish your roadmap on your site").
-mod_prio(1000).
-mod_schema(1).

-include_lib("zotonic.hrl").

-export([
    init/1,
    observe_custom_pivot/2,
    manage_schema/2
]).

%% Minimum day, inserted for date start search ranges
-define(EPOCH_START, {{-4000,1,1},{0,0,0}}).

init(Context) ->
    z_pivot_rsc:define_custom_pivot(?MODULE, [
        {pivot_is_feedback_needed, "boolean not null default false"},
        {pivot_is_planned, "boolean not null default false"},
        {pivot_is_released, "boolean not null default false"},
        {pivot_planned_date_start, "timestamp with time zone"},
        {pivot_planned_date_end, "timestamp with time zone"},
        {pivot_release_date, "timestamp with time zone"}
    ], Context),
    ok.

observe_custom_pivot(#custom_pivot{id=Id}, Context) ->
    case m_rsc:is_a(Id, roadmap_item, Context) of
        false -> none;
        true ->
            {PlannedStart, PlannedEnd} = pivot_date_range(m_rsc:p_no_acl(Id, planned_date_start, Context), 
                 m_rsc:p(Id, planned_date_end, Context)),
            {?MODULE, [
                {pivot_is_feedback_needed, z_convert:to_bool(m_rsc:p_no_acl(Id, is_feedback_needed, Context))},
                {pivot_is_planned, z_convert:to_bool(m_rsc:p_no_acl(Id, is_planned, Context))},
                {pivot_is_released, z_convert:to_bool(m_rsc:p_no_acl(Id, is_released, Context))},
                {pivot_planned_date_start, PlannedStart},
                {pivot_planned_date_end, PlannedEnd},
                {pivot_release_date, pivot_date(m_rsc:p_no_acl(Id, release_date, Context))}
            ]}
    end.

manage_schema(_Version, Context) ->
    DataModel = #datamodel{
         resources=[ 
             {roadmap_home, text, [{title, <<"Roadmap">>}, {summary, <<"Our roadmap!">>}] } 
         ],
         categories=[
             {roadmap_item, text, [{title, <<"Roadmap Item">>}]}
         ]
    },

    %% TODO, add roadmap_home publication

    z_datamodel:manage(?MODULE, DataModel, Context).

%%
%% Helpers
%%

pivot_date_range(Start, End) -> 
    case {pivot_date(Start), pivot_date(End)} of
        {undefined, undefined}=U -> U;
        {undefined, EndDate} -> {?EPOCH_START, EndDate};
        {StartDate, undefined} -> {StartDate, ?ST_JUTTEMIS};
        {_StartDate, _EndDate}=R -> R
    end.

pivot_date(Date) -> z_datetime:undefined_if_invalid_date(Date).
