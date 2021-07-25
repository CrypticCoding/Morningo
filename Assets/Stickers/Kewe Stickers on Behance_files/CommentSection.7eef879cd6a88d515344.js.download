(("undefined" != typeof global ? global : self).webpackJsonp = ("undefined" != typeof global ? global : self).webpackJsonp || []).push([ [ 52 ], {
    "3gPS": function(e, t, n) {
        e.exports = n("ydjK")("3gPS");
    },
    AZuE: function(e, t, n) {
        "use strict";
        n.r(t);
        n("1t7P"), n("jQ/y"), n("aLgo"), n("hBpG"), n("lTEL"), n("6U7i"), n("7x/C"), n("87if"), 
        n("kYxP");
        var i, o = n("xeH2"), s = n.n(o), r = n("IC1n"), a = n.n(r), u = n("DZde"), c = (n("LW0h"), 
        n("jwue"), n("daRM"), n("FtHn"), n("+KXO"), n("iKE+"), n("KqXw"), n("DZ+c"), n("MvUL"), 
        n("+oxZ"), n("w5nM")), l = (n("2G9S"), n("vrRf"), n("z84I"), n("KOtZ"), n("M+/F"), 
        n("/2/H")), m = n("gt27"), p = {
            global: "/v2/users?mentions=1",
            local: ""
        }, d = 2, f = 5, _ = function(e) {
            return this[e];
        }, h = function(e) {
            var t = this.toLocaleLowerCase();
            return 0 === e.first_name.toLocaleLowerCase().indexOf(t) || 0 === e.last_name.toLocaleLowerCase().indexOf(t) || 0 === e.username.toLocaleLowerCase().indexOf(t);
        }, g = function(e) {
            return Object.keys(this).map(_, this).filter(h, e);
        }, b = function(e) {
            return g.call(e, this);
        };
        function v(e) {
            return i = function(e) {
                for (var t = {}, n = 0; n < e.length; ++n) t[e[n].id] = e[n];
                return t;
            }(e);
        }
        function y() {
            var e;
            return i ? (e = new l.default).resolve(i) : e = Object(m.default)(p.local).then(v), 
            e;
        }
        function O(e) {
            return y().then(b.bind(e));
        }
        var x = function e(t, n) {
            var i, o;
            return (e._cache = e._cache || {})[t] = e._cache[t] || {}, n.length < d && (o = []), 
            e._cache[t][n] && (o = e._cache[t][n]), o ? ((i = new l.default).resolve(o), i) : Object(m.default)({
                url: t,
                data: {
                    q: n
                }
            }).then((function(i) {
                return o = i.users, e._cache[t][n] = o, o;
            }));
        }.bind(null, p.global), w = {
            init: function(e) {
                return e.maxResults && (f = e.maxResults), e.minLength && (d = e.minLength), e.local && (p.local = e.local), 
                i = null, this;
            },
            getLocal: y,
            source: function(e, t) {
                var n = [ O, x ].map((function(t) {
                    return t(e.term);
                })), i = [];
                function o() {
                    var e, n;
                    t((e = i, n = {}, e.filter((function(e) {
                        return !(e.id in n) && (n[e.id] = e, !0);
                    }))).slice(0, f));
                }
                n.reduce((function(e, t) {
                    return (e ? e.then((function() {
                        return t;
                    })) : t).then((function(e) {
                        e.forEach((function(e) {
                            e.value = e.username;
                        })), i = i.concat(e), o();
                    }));
                }), null).then(null, o);
            }
        }, E = n("Layl"), j = n.n(E), C = (n("vXAe"), /(?:^|[^\w])@(\w+)/);
        s.a.widget("be.automention", s.a.be.autosuggest, {
            _create: function() {
                this._super(), this._on(this.element, {
                    mouseup: this.check,
                    input: this.check,
                    keyup: this.check,
                    blur: this._clear
                }), this.menu.element.addClass("mention-menu");
            },
            _mention: {
                value: "",
                start: 0,
                end: 0
            },
            _last: null,
            _value: function(e) {
                if (!e) return this._mention.value;
                var t = this._super(), n = t.indexOf("@", this._mention.start) + 1;
                e = t.substring(0, n) + e, " " !== t.charAt(this._mention.end) && (e += " "), e += t.substring(this._mention.end), 
                this._super(e), this.element.trigger("input");
            },
            _clear: function() {
                this._last = null;
            },
            check: function(e) {
                if (this.element.is(document.activeElement)) {
                    var t, n, i, o = document.activeElement.value, s = document.activeElement.selectionStart;
                    s && o && (n = o.lastIndexOf(" ", s - 1), i = ~(i = o.indexOf(" ", s)) ? i : 1 / 0, 
                    t = o.substring(n, i), t = (t = C.exec(t)) && t[1], this._last !== t && (this._mention.value = t || "", 
                    this._mention.start = n, this._mention.end = i, this.search(null, e), this._trigger("value", e, t)), 
                    this._last = t);
                }
            }
        }), s.a.extend(s.a.be.automention, {
            usernameMatch: C
        });
        var T = s.a.be.automention;
        function S(e, t) {
            var n = Object.keys(e);
            if (Object.getOwnPropertySymbols) {
                var i = Object.getOwnPropertySymbols(e);
                t && (i = i.filter((function(t) {
                    return Object.getOwnPropertyDescriptor(e, t).enumerable;
                }))), n.push.apply(n, i);
            }
            return n;
        }
        function R(e, t, n) {
            return t in e ? Object.defineProperty(e, t, {
                value: n,
                enumerable: !0,
                configurable: !0,
                writable: !0
            }) : e[t] = n, e;
        }
        var L = function(e, t) {
            if (t = function(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? S(Object(n), !0).forEach((function(t) {
                        R(e, t, n[t]);
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : S(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t));
                    }));
                }
                return e;
            }({
                maxMentions: 5
            }, t), w.init(t), e.length) {
                var n = new RegExp(T.usernameMatch.source, "g");
                e.parent().addClass("ui-front").end().one("focus", w.getLocal).automention({
                    delay: 500,
                    itemTemplate: j.a,
                    source: w.source,
                    appendTo: t.appendTo
                }).on("automentionopen", (function() {
                    var e, i, o = this.value, r = {}, a = s()(this);
                    o.replace(n, (function(e, t) {
                        r[e] = t;
                    })), Object.keys(r).length > t.maxMentions && (e = a.data("beAutomention"), (i = a.data("errorbar") || new c.a.Errorline(e.menu.element)).render("<strong>You may only mention " + t.maxMentions + " users</strong>"), 
                    i.$view.prependTo(e.menu.element), a.data("errorbar", i));
                }));
            }
        }, k = n("8rTe"), $ = n("OkiZ").a.extend({
            _submit: function(e) {
                var t = this;
                return this._super(e).then((function() {
                    t.$form.find(":input").val("").removeAttr("checked selected");
                }));
            }
        }), M = n("BHX3"), P = n("tIFS"), D = n("k4sX"), I = n.n(D), A = n("md4j"), U = n("E8ap");
        function N(e) {
            return (N = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                return typeof e;
            } : function(e) {
                return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e;
            })(e);
        }
        t.default = u.default.extend({
            _total: 0,
            _guidelinesWarningMsg: M.default.translate("comment_guidelines_warning", 'Your comment doesn\'t follow our <a href="/misc/community#comments" target="_blank">comment guidelines.</a>'),
            init: function(e, t) {
                var n = this, i = e instanceof s.a ? e : s()(e);
                this._$context = i, this._id = Number(i[0].dataset.id), this._$view = i.find(".js-post-comment-block"), 
                this._$commentText = i.find(".js-comment-textarea"), this._$commentWarning = i.find(".js-comment-warning"), 
                this._$formItemContainer = i.find(".js-comment-form-item-container"), this._$submit = i.find(".js-submit"), 
                this._commentContainer = this._initCommentContainer(), this._config = t || {}, this._sessionId = a()(), 
                this._$commentText.on("focus", (function() {
                    return n.trigger("input.focus");
                })), this._$commentText.on("blur", (function() {
                    return n.trigger("input.blur");
                }));
            },
            bind: function() {
                L(this._$commentText, {
                    local: "/mentions/project/" + this._id
                }), this._bindForm(), this._commentContainer.get();
            },
            unbind: function() {
                this._form && this._form.destroy(), this._commentContainer.destroy(), this._$view && this._$view.remove();
            },
            _setTotal: function(e) {
                this._total = e, this._$context.find(".js-comments-total").text(e ? "(" + e + ")" : "");
            },
            _initCommentContainer: function() {
                var e, t = this, n = this._id, i = this, o = ".js-see-more", s = this._$context.find(o);
                return e = k.b.extend({
                    moreSelector: o
                }).init(this._$context, {
                    type: "project",
                    entity_id: n
                }, (function(e) {
                    s.toggleClass("hide", !e.more), i._setTotal(+e.total);
                })), this.listenTo(e, "remove", (function() {
                    this._setTotal(this._total - 1), i.trigger("removed");
                })), this.listenTo(e, k.a.childHasFocus, (function() {
                    return t.trigger(k.a.childHasFocus);
                })), this.listenTo(e, k.a.childLostFocus, (function() {
                    return t.trigger(k.a.childLostFocus);
                })), e;
            },
            _logValidationError: function(e) {
                var t = e.http_code, n = e.messages, i = void 0 === n ? [] : n, o = e.code;
                return A.default.info("analytics", "comment failed validation", {
                    project_id: this._id,
                    reason: i.length ? i[0].message : null,
                    httpResponseCode: t,
                    code: o,
                    isBlockedRateLimitViolation: o === this._config.COMMENT_ERROR_CODES.ERROR_VALIDATION,
                    session_id: this._sessionId
                }), A.default.send();
            },
            _bindForm: function() {
                var e = this, t = this._id;
                this._$submit.length && (this._form = $.extend({
                    hideButtonText: M.default.translate("comments_hidebutton_posting", "Posting..."),
                    _findFormError: function(t) {
                        t.comment && "object" !== N(t.responseJSON) && e._setFormInErrorState(t.comment), 
                        this._super(t);
                    },
                    hideButtons: function() {},
                    _setDisabled: function() {
                        var t = !(arguments.length > 0 && void 0 !== arguments[0]) || arguments[0];
                        e._$context.find(".js-posting").toggleClass("hide", !t), e._$submit.toggleClass("hide", t);
                    },
                    showButtons: function() {
                        this._setDisabled(!1);
                    }
                }).init(this._$view).on("success", (function() {
                    var t = this;
                    this.showButtons(), A.default.info("analytics", "comment submitted", {
                        project_id: e._id,
                        session_id: e._sessionId
                    }), A.default.send().then((function() {
                        return t.trigger("loggedSuccess");
                    })), e._sessionId = a()();
                })), this._form.handlers.length = 0, this._form.commit = function(n) {
                    return n.data.entity_id = t, e._form._setDisabled(), this.then((function(t) {
                        !function(t) {
                            if (!t.id || !t.user) throw t;
                            e._commentContainer.add({
                                id: t.id,
                                user: t.user,
                                comment: t.comment,
                                posted_on: M.default.translate("comments_just_now", "Just now"),
                                permissions: [ 3e3 ]
                            }), e._setTotal(e._total + 1), e.trigger("added");
                        }(t), e._removeFormFromErrorState();
                    })).catch((function(t) {
                        return e._setFormInErrorState(t.responseJSON), e._logValidationError(t.responseJSON);
                    })), this;
                }, this._$commentText.on("change", (function() {
                    e._removeFormFromErrorState();
                })), this._bindCommentGuidelines());
            },
            _bindCommentGuidelines: function() {
                var e = this;
                this._$commentText.on("focus", (function() {
                    e._config.USER_HAS_ACKNOWLEDGED_GUIDELINES_POPUP || (e._$commentText.blur(), A.default.info("analytics", "comment guidelines rendered", {
                        project_id: e._id
                    }), Object(P.default)({
                        classes: [ "popup-comment-guidelines qa-popup-comment-guidelines" ],
                        html: I()({
                            assetsUrl: U.ASSETS_URL
                        }),
                        hideClose: !0,
                        buttons: [ {
                            label: M.default.translate("comments_got_it", "Got it!"),
                            classes: [ "js-confirm" ]
                        } ]
                    }).then((function() {
                        return e._config.USER_HAS_ACKNOWLEDGED_GUIDELINES_POPUP = !0, A.default.info("analytics", "comment guidelines acknowledged", {
                            project_id: e._id
                        }), Object(m.default)({
                            method: "POST",
                            url: "/v2/users/me/flags/comment_guidelines_popup"
                        }).then((function() {
                            e.trigger("commentGuidelinesAcknowledged");
                        }));
                    })), s()(".js-blocking-div").off());
                }));
            },
            _formatErrorMessage: function(e) {
                if ("string" == typeof e) return M.default.translateErrorMessage(e);
                if ("object" === N(e)) {
                    var t = e.http_code, n = e.messages, i = void 0 === n ? [] : n;
                    return t === this._config.COMMENT_ERROR_CODES.TOO_MANY_REQUESTS && i.length && i[0].message ? i[0].message : this._guidelinesWarningMsg;
                }
                return "";
            },
            _setFormInErrorState: function(e) {
                "object" === N(e) && e.http_code === this._config.COMMENT_ERROR_CODES.TOO_MANY_REQUESTS && e.code === this._config.COMMENT_ERROR_CODES.ERROR_VALIDATION && this._showRateLimitPopup(e), 
                e.http_code !== U.HTTP_CODE_EXPECTATION_FAILURE && this._$commentWarning.removeClass("hide").html(this._formatErrorMessage(e)), 
                this._$formItemContainer.addClass("form-item-error");
            },
            _removeFormFromErrorState: function() {
                this._$commentWarning.addClass("hide").html(""), this._$formItemContainer.removeClass("form-item-error");
            },
            _showRateLimitPopup: function() {
                var e = "\n      <p>" + M.default.translate("comment_ratelimit_popup_text_violation", 'Your comments have repeatedly violated our <a href="/misc/community#comments" target="_blank">community guidelines</a>. Continued violation of these guidelines may result in a permanent ban.') + "</p>\n      <p>" + M.default.translate("comment_ratelimit_popup_text_appreciate", "We appreciate your understanding.") + "</p>\n      <p>" + M.default.translate("comment_ratelimit_popup_text_contact", 'If you have questions or believe this was shown in error, please <a href="https://help.behance.net" target="_blank">contact us</a>.') + "</p>\n    ";
                Object(P.default)({
                    classes: [ "popup-comment-ratelimit" ],
                    title: M.default.translate("comment_ratelimit_popup_title", "You've reached the comment limit"),
                    html: e,
                    buttons: [ {
                        label: M.default.translate("comments_got_it_no_exclamation", "Got it"),
                        classes: [ "js-confirm" ]
                    } ]
                });
            }
        });
    },
    AsM6: function(e, t, n) {
        var i = n("6QaK"), o = {}, s = new i.Template({
            code: function(e, t, n) {
                var i = this;
                return i.b(n = n || ""), i.b('<div class="error'), i.s(i.f("containerClasses", e, t, 1), e, t, 0, 38, 44, "{{ }}") && (i.rs(e, t, (function(e, t, n) {
                    n.b(" "), n.b(n.v(n.d(".", e, t, 0)));
                })), e.pop()), i.b('">'), i.b("\n" + n), i.b('  <span class="error__copy">'), i.b(i.t(i.f("message", e, t, 0))), 
                i.b("</span>"), i.b("\n" + n), i.b("</div>"), i.b("\n"), i.fl();
            },
            partials: {},
            subs: {}
        }, '<div class="error{{#containerClasses}} {{.}}{{/containerClasses}}">\n  <span class="error__copy">{{{message}}}</span>\n</div>\n', i);
        s.ri = function(e, t, n) {
            return i.helpers && e.unshift(i.helpers), this.r(e, (s = o, r = t, Object.keys(r).reduce((function(e, t) {
                return e[t] = r[t], e;
            }), s)), n);
            var s, r;
        }, e.exports = s.render.bind(s), e.exports.template = s;
    },
    L2rT: function(e, t, n) {
        e.exports = n("ydjK")("L2rT");
    },
    Layl: function(e, t, n) {
        var i = n("6QaK"), o = {
            "bestyleguide/_avatar": n("1hEZ").template
        }, s = new i.Template({
            code: function(e, t, n) {
                var i = this;
                return i.b(n = n || ""), i.b('<li class="ui-menu-item">'), i.b("\n" + n), i.b('  <div class="mention-user-wrap">'), 
                i.b("\n" + n), i.b(i.rp("<bestyleguide/_avatar0", e, t, "")), i.b('    <div class="mention-displayname e2e-User-displayname">'), 
                i.b(i.v(i.f("display_name", e, t, 0))), i.b("</div>"), i.b("\n" + n), i.b('    <div class="mention-minor">@'), 
                i.b(i.v(i.f("username", e, t, 0))), i.b("</div>"), i.b("\n" + n), i.b("  </div>"), 
                i.b("\n" + n), i.b("</li>"), i.b("\n"), i.fl();
            },
            partials: {
                "<bestyleguide/_avatar0": {
                    name: "bestyleguide/_avatar",
                    partials: {},
                    subs: {
                        src: function(e, t, n, i) {
                            n.b(n.v(n.d("images.50", e, t, 0)));
                        },
                        srcLarge: function(e, t, n, i) {
                            n.b(n.v(n.d("images.115", e, t, 0)));
                        }
                    }
                }
            },
            subs: {}
        }, '<li class="ui-menu-item">\n  <div class="mention-user-wrap">\n    {{<bestyleguide/_avatar}}\n      {{$src}}{{images.50}}{{/src}}\n      {{$srcLarge}}{{images.115}}{{/srcLarge}}\n    {{/bestyleguide/_avatar}}\n    <div class="mention-displayname e2e-User-displayname">{{display_name}}</div>\n    <div class="mention-minor">@{{username}}</div>\n  </div>\n</li>\n', i);
        s.ri = function(e, t, n) {
            return i.helpers && e.unshift(i.helpers), this.r(e, (s = o, r = t, Object.keys(r).reduce((function(e, t) {
                return e[t] = r[t], e;
            }), s)), n);
            var s, r;
        }, e.exports = s.render.bind(s), e.exports.template = s;
    },
    ZdBB: function(e, t, n) {
        e.exports = n("ydjK")("ZdBB");
    },
    eTN2: function(e, t, n) {
        e.exports = n("ydjK")("eTN2");
    },
    "iKE+": function(e, t, n) {
        var i = n("1Mu/"), o = n("9JhN"), s = n("66wQ"), r = n("j6nH"), a = n("q9+l").f, u = n("ZdBB").f, c = n("jl0/"), l = n("q/0V"), m = n("L2rT"), p = n("uLp7"), d = n("ct80"), f = n("zc29").set, _ = n("Ch6y"), h = n("fVMg")("match"), g = o.RegExp, b = g.prototype, v = /a/g, y = /a/g, O = new g(v) !== v, x = m.UNSUPPORTED_Y;
        if (i && s("RegExp", !O || x || d((function() {
            return y[h] = !1, g(v) != v || g(y) == y || "/a/i" != g(v, "i");
        })))) {
            for (var w = function(e, t) {
                var n, i = this instanceof w, o = c(e), s = void 0 === t;
                if (!i && o && e.constructor === w && s) return e;
                O ? o && !s && (e = e.source) : e instanceof w && (s && (t = l.call(e)), e = e.source), 
                x && (n = !!t && t.indexOf("y") > -1) && (t = t.replace(/y/g, ""));
                var a = r(O ? new g(e, t) : g(e, t), i ? this : b, w);
                return x && n && f(a, {
                    sticky: n
                }), a;
            }, E = function(e) {
                e in w || a(w, e, {
                    configurable: !0,
                    get: function() {
                        return g[e];
                    },
                    set: function(t) {
                        g[e] = t;
                    }
                });
            }, j = u(g), C = 0; j.length > C; ) E(j[C++]);
            b.constructor = w, w.prototype = b, p(o, "RegExp", w);
        }
        _("RegExp");
    },
    "jl0/": function(e, t, n) {
        e.exports = n("ydjK")("jl0/");
    },
    k4sX: function(e, t, n) {
        var i = n("6QaK"), o = {}, s = new i.Template({
            code: function(e, t, n) {
                var i = this;
                return i.b(n = n || ""), i.b("<div>"), i.b("\n" + n), i.b('  <p class="popup-title">'), 
                i.s(i.f("translate", e, t, 1), e, t, 0, 45, 94, "{{ }}") && (i.rs(e, t, (function(e, t, n) {
                    n.b("comment_guidelines_popup_title|Comment Guidelines");
                })), e.pop()), i.b("</p>"), i.b("\n" + n), i.b('  <p class="popup-subtitle">'), 
                i.s(i.f("translate", e, t, 1), e, t, 0, 155, 235, "{{ }}") && (i.rs(e, t, (function(e, t, n) {
                    n.b("comment_guidelines_popup_subtitle|Before you comment, please read the guidelines");
                })), e.pop()), i.b("</p>"), i.b("\n" + n), i.b('  <div class="popoup-image">'), 
                i.b("\n" + n), i.b('    <img src="'), i.b(i.v(i.f("assetsUrl", e, t, 0))), i.b('img/comments/comment-guidelines.png" srcset="'), 
                i.b(i.v(i.f("assetsUrl", e, t, 0))), i.b("img/comments/comment-guidelines.png, "), 
                i.b(i.v(i.f("assetsUrl", e, t, 0))), i.b('img/comments/comment-guidelines@2x.png 2x">'), 
                i.b("\n" + n), i.b("  </div>"), i.b("\n" + n), i.b('  <div class="popup__guidelines">'), 
                i.b("\n" + n), i.b('    <h4 class="popup__guidelines-header">'), i.s(i.f("translate", e, t, 1), e, t, 0, 560, 611, "{{ }}") && (i.rs(e, t, (function(e, t, n) {
                    n.b("comment_guidelines_popup_header_topic|Stay On-Topic");
                })), e.pop()), i.b("</h4>"), i.b("\n" + n), i.b('    <p class="popup__guidelines-guideline">'), 
                i.s(i.f("translate", e, t, 1), e, t, 0, 688, 907, "{{ }}") && (i.rs(e, t, (function(e, t, n) {
                    n.b("comment_guidelines_popup_text_topic|Comments must be about the creative work in the project that you are commenting on. Don't use comments on someone else's project to promote your own work or to link to other websites.");
                })), e.pop()), i.b("</p>"), i.b("\n" + n), i.b('    <p class="popup__guidelines-guideline">'), 
                i.s(i.f("translate", e, t, 1), e, t, 0, 983, 1124, "{{ }}") && (i.rs(e, t, (function(e, t, n) {
                    n.b("comment_guidelines_popup_text_off_topic|We consider off-topic posts 'spam' and we deactivate accounts that repeatedly violate this guideline.");
                })), e.pop()), i.b("</p>"), i.b("\n" + n), i.b('    <h4 class="popup__guidelines-header">'), 
                i.s(i.f("translate", e, t, 1), e, t, 0, 1198, 1251, "{{ }}") && (i.rs(e, t, (function(e, t, n) {
                    n.b("comment_guidelines_popup_header_respect|Be Respectful");
                })), e.pop()), i.b("</h4>"), i.b("\n" + n), i.b('    <p class="popup__guidelines-guideline">'), 
                i.s(i.f("translate", e, t, 1), e, t, 0, 1328, 1527, "{{ }}") && (i.rs(e, t, (function(e, t, n) {
                    n.b("comment_guidelines_popup_text_respect|Although we are all for free expression, we ask that you keep your comments constructive and respectful. We don't tolerate abusive, vulgar or insulting comments.");
                })), e.pop()), i.b("</p>"), i.b("\n" + n), i.b("  </div>"), i.b("\n" + n), i.b("</div>"), 
                i.b("\n"), i.fl();
            },
            partials: {},
            subs: {}
        }, '<div>\n  <p class="popup-title">{{#translate}}comment_guidelines_popup_title|Comment Guidelines{{/translate}}</p>\n  <p class="popup-subtitle">{{#translate}}comment_guidelines_popup_subtitle|Before you comment, please read the guidelines{{/translate}}</p>\n  <div class="popoup-image">\n    <img src="{{assetsUrl}}img/comments/comment-guidelines.png" srcset="{{assetsUrl}}img/comments/comment-guidelines.png, {{assetsUrl}}img/comments/comment-guidelines@2x.png 2x">\n  </div>\n  <div class="popup__guidelines">\n    <h4 class="popup__guidelines-header">{{#translate}}comment_guidelines_popup_header_topic|Stay On-Topic{{/translate}}</h4>\n    <p class="popup__guidelines-guideline">{{#translate}}comment_guidelines_popup_text_topic|Comments must be about the creative work in the project that you are commenting on. Don\'t use comments on someone else\'s project to promote your own work or to link to other websites.{{/translate}}</p>\n    <p class="popup__guidelines-guideline">{{#translate}}comment_guidelines_popup_text_off_topic|We consider off-topic posts \'spam\' and we deactivate accounts that repeatedly violate this guideline.{{/translate}}</p>\n    <h4 class="popup__guidelines-header">{{#translate}}comment_guidelines_popup_header_respect|Be Respectful{{/translate}}</h4>\n    <p class="popup__guidelines-guideline">{{#translate}}comment_guidelines_popup_text_respect|Although we are all for free expression, we ask that you keep your comments constructive and respectful. We don\'t tolerate abusive, vulgar or insulting comments.{{/translate}}</p>\n  </div>\n</div>\n', i);
        s.ri = function(e, t, n) {
            return i.helpers && e.unshift(i.helpers), this.r(e, (s = o, r = t, Object.keys(r).reduce((function(e, t) {
                return e[t] = r[t], e;
            }), s)), n);
            var s, r;
        }, e.exports = s.render.bind(s), e.exports.template = s;
    },
    "q/0V": function(e, t, n) {
        e.exports = n("ydjK")("q/0V");
    },
    w5nM: function(e, t, n) {
        "use strict";
        n("vrRf");
        var i = n("xeH2"), o = n.n(i), s = n("3gPS"), r = n("+eOo"), a = n("AsM6"), u = n.n(a), c = n("nE2t"), l = o()("<div>");
        function m(e) {
            return ~e.indexOf("&lt;") ? l.html(e).text() : e;
        }
        var p, d = s.default.extend({
            template: Object(r.a)(u.a, o.a),
            templateData: function() {
                return {
                    message: "Oops, an error occurred. | <a class='js-reload'>Please Refesh.</a>"
                };
            },
            render: function(e) {
                return e = e ? {
                    message: m(e)
                } : null, this._super(e);
            },
            rendered: function() {
                this.$view.on("click", ".js-reload", (function() {
                    c.default.reloadLocation();
                })).show();
            },
            hide: function() {
                return this.$view && this.$view.hide();
            }
        }), f = {
            init: function(e) {
                return p = new d(e);
            },
            show: function(e) {
                p && p.render(e);
            },
            hide: function() {
                p && p.hide();
            },
            Errorline: d
        };
        t.a = f;
    }
} ]);
//# sourceMappingURL=CommentSection.7eef879cd6a88d515344.js.map