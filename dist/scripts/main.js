(function(){var e;e=function(e){"use strict";var t,a,n,i,l,r,s,o,c,p,d,_,u;return s=e("#tabs"),t=e(".cliparts__item-wrapper"),a=e(".cliparts-item"),o=e(".gallery-content__tags-link"),l=e(".header__nav-item"),r=e(".top-panel__open-btn"),n=e(".footer__close"),i=e(".gallery"),u=function(){var t;return t=e(this),t.siblings().removeClass("active"),t.toggleClass("active"),e(".top-panel").slideDown()},_=function(){return e(this).addClass("hidden"),i.slideDown(),e(".footer").slideDown()},c=function(){return e(this).parent().slideUp(),r.removeClass("hidden"),i.slideUp()},d=function(){var t,a,n;return a=e(this),n=a.attr("href").replace("#",""),a.hasClass("active")?(a.removeClass("active").parent().siblings(".gallery-content__collections-wrapper").find(".gallery-content__collections-row."+n).removeClass("active").fadeOut(),t=a.parent().siblings(".gallery-content__collections-wrapper").find(".gallery-content__collections-row"),t.hasClass("active")||t.fadeIn(),!1):(a.addClass("active"),a.parent().siblings(".gallery-content__collections-wrapper").find(".gallery-content__collections-row").not(".active").fadeOut().parent().find(".gallery-content__collections-row."+n).addClass("active").fadeIn())},p={init:function(){return l.on("click",u),r.on("click",_),o.on("click",d),n.on("click",c),s.tabs(),a.draggable({revert:"invalid",helper:"clone"}),t.droppable({activeClass:"ui-state-default",hoverClass:"ui-state-hover",drop:function(t,a){var n,i,l;return i=a.draggable,n=e("#cliparts"),e(this).addClass("ui-state-highlight").html(i),l=n.find(".cliparts-item").length,l>=9?n.append('<div class="cliparts__item-wrapper ui-droppable"><span class="cliparts__item-wrapper-text">Добавить клипарт</span></div>'):void 0}})}}}(jQuery),$(document).ready(function(){return e.init()})}).call(this);