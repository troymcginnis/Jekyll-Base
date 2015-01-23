# DOM-based Routing
# Based on http://goo.gl/EUTi53 by Paul Irish
#
# Only fires on body classes that match.

#= require vendor/jquery
#= require vendor/bootstrap


WEBSITE =
    common:
        init: () ->
            return

    home:
        init: () ->
            return

UTIL =
    fire: (func, funcname, args) ->
        namespace = WEBSITE
        funcname = if funcname is undefined then 'init' else funcname

        if func isnt '' and namespace[func] and typeof namespace[func][funcname] is 'function'
            namespace[func][funcname](args)

    loadEvents: () ->
        UTIL.fire('common')

        $.each document.body.className.split(/\s+/), (i, class_name) ->
            body_tag = class_name.replace('body-', '').replace(/-/g, '_')
            UTIL.fire(body_tag)

$(document).ready UTIL.loadEvents
