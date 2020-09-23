/* thumbviewer.js
----------------------------------------------------------

Adapted z.imageviewer.js to be able to work with tablets and
phones.

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

---------------------------------------------------------- */

$.widget("ui.thumbviewer",
{
    _init: function() {
        let image = this.element;

        /* Defer the init to when the image is loaded */
        if(image[0].complete) {
            this.init()
        } else {
            $(image[0]).on("load", this.init.bind(this));
        }
    },

    init: function() {
        var image = this.element;
        var loadImageFun = this.loadImage.bind(this);

        this.bigImg = $('<img/>').hide();
        this.bigImg.attr("alt", image.attr('alt'));
        this.bigImg.addClass("thumbviewer bigimg");

        image.after(this.bigImg);
        image.click(loadImageFun);

        this.loader = null;
        this.overlay = null;
    },

    loadImage: function() {
        var ui = this;

        var image = this.element;
        var bigImg = this.bigImg;

        var imageOrigSrc = image.attr('src').split('.');
        var imageTempSrc = imageOrigSrc[0].split('/image/');
        var imageExt = imageOrigSrc[imageOrigSrc.length - 1];
        var imageSrc = '/media/inline/' + imageTempSrc[imageTempSrc.length - 1] + '.' + imageExt;

        if(this.overlay || this.loader) {
            return;
        }

        if(bigImg.hasClass("loaded-bigImage")) {
            ui.showBig();
            return;
        }

        this.loader = $('<div></div>')
            .css({
                width: image.width(),
                height: image.height(),

                position: "absolute",
                top: image.position().top,
                left: image.position().left
            });
        this.loader.addClass("thumbviewer loader");

        image.after(this.loader);

        $(this.bigImg).on("load",
            function(e) {
                $(this).hide().addClass('loaded-bigImage').off('load');

                ui.loader.remove();
                ui.loader = null;

                ui.setWidthHeight();
                ui.showBig();
            });
        this.bigImg.attr("src", imageSrc);
        this.bigImg.click(ui.hideBig.bind(this));
    },

    setWidthHeight: function() {
        this.bigImg.attr({
            // get the original image dimensions,
            // rather than the calculated ones
            width: $(this.bigImg, this.element.parent())[0].width,
            height: $(this.bigImg, this.element.parent())[0].height
        });
    },

    showBig: function() {
        var ui = this;

        var imgObj = this.bigImg;

        var zoomImgWidth = imgObj.attr('width');
        var zoomImgHeight = imgObj.attr('height');

        var fullWidth = zoomImgWidth;
        var fullHeight = zoomImgHeight;

        if(zoomImgWidth > $(window).width()) {
            fullWidth = $(window).width() - 40;
            fullHeight = zoomImgHeight * (fullWidth / zoomImgWidth);
        }

        if(zoomImgHeight > $(window).height()) {
            fullHeight = $(window).height() - 40;
            fullWidth = zoomImgWidth * (fullHeight / zoomImgHeight);
        }

        var leftPos = ($(window).width() / 2) - (fullWidth / 2);
        var topPos = ($(window).height() / 2) - (fullHeight / 2);

        this.overlay = $('<span></span>')
            .addClass('thumbviewer overlay')
            .css({
                display: 'none',
                position: "fixed",
                background: "#000",
                    width: "100%",
                    height: "100%",
                    top: 0,
                    left: 0,
            })
        this.element.after(this.overlay);
        this.overlay.show().animate({opacity: 0.8}, 200);
        this.overlay.click(this.hideBig.bind(this));

        imgObj.css({
            display: 'none',
            position: "fixed",
            width: fullWidth,
            height: fullHeight,
            left: leftPos,
            top: topPos,
        }).fadeIn(200)

    },

    hideBig: function() {
        this.bigImg.fadeOut(200);

        if(this.overlay === null)
            return;

        this.overlay.hide();
        this.overlay.remove();
        this.overlay = null;
    }
});
