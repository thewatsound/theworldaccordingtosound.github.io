---
---

SC_CLIENT_ID = '75d9afd09a01b26915716ee1590f6c70'

SC_IFRAME_PARAMS =
    color: '0066cc'
    auto_play: false
    hide_related: true
    show_comments: false
    show_user: false
    show_reposts: false
    download: false
    buying: false
    liking: false
    sharing: true
    show_artwork: true
    show_playcount: false

SC_IFRAME_ATTR =
    width: '100%'
    height: 166
    scrolling: 'no'
    frameborder: 'no'

SC_URL = "https://w.soundcloud.com/player/?"
SC_PARAM_URL = "https://api.soundcloud.com/tracks/"

$ ->
    SC.initialize(client_id: SC_CLIENT_ID)
    SC.get('/users/162376586/playlists/151785242')
        .then ({tracks}) ->
            for track in tracks
                SC_IFRAME_PARAMS.url = SC_PARAM_URL + track.id
                iframe = $("<iframe></iframe>")
                iframe.attr(SC_IFRAME_ATTR)
                iframe.attr('src', SC_URL + $.param(SC_IFRAME_PARAMS))

                $('.post-list').append(
                    $('<li></li>').append(iframe)
                )
