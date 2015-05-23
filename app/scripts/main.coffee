Events = ( ( $ ) ->
  'use strict'

  $tabs = $ '#tabs'

  # cliparts
  $clipartContainer = $ '.cliparts__item-wrapper'
  $clipartItem = $ '.cliparts-item'

  # tags
  $tagBtn = $ '.gallery-content__tags-link'

  # menu
  $menuItem = $ '.header__nav-item'

  # open and close collections button
  $openCollectionsBtn = $ '.top-panel__open-btn'
  $closeCollectionsBtn = $ '.footer__close'

  $gallery = $ '.gallery'

  # open library
  openLibrary = ->
    $this = $ @

    $this.siblings().removeClass('active')
    $this.toggleClass('active')

    $('.top-panel').slideDown()

  openCollections = ->
    $(@).addClass 'hidden'

    $gallery
      .slideDown()

    $ '.footer'
      .slideDown()

  closeCollections = ->
    $(@).parent().slideUp()

    $openCollectionsBtn.removeClass 'hidden'

    $gallery
      .slideUp()

  filterByTag = ->
    $this = $ @

    # get tag
    tag = $this.attr('href').replace '#', ''

    if $this.hasClass 'active'
      $this
        .removeClass 'active'
        .parent().siblings '.gallery-content__collections-wrapper'
        .find '.gallery-content__collections-row.' + tag
        .removeClass 'active'
        .fadeOut()

      # get all rows
      $rows = $this.parent().siblings( '.gallery-content__collections-wrapper' ).find('.gallery-content__collections-row')

      # if nothing is active, show all
      if !$rows.hasClass('active')
        $rows.fadeIn()

      return false

    # add active class
    $this.addClass 'active'

    $this
      .parent().siblings '.gallery-content__collections-wrapper'
      .find '.gallery-content__collections-row'
      .not '.active'
      .fadeOut()
      .parent()
      .find '.gallery-content__collections-row.' + tag
      .addClass 'active'
      .fadeIn()

  #return public api
  events =

    # init function
    init: ->
      $menuItem.on 'click', openLibrary
      $openCollectionsBtn.on 'click', openCollections
      $tagBtn.on 'click', filterByTag
      $closeCollectionsBtn.on 'click', closeCollections

      # jquery ui tabs
      $tabs.tabs()

      # draggable
      $clipartItem.draggable
        revert: 'invalid'
        helper: 'clone'

      # droppable
      $clipartContainer.droppable
        activeClass: "ui-state-default"
        hoverClass: "ui-state-hover"

        drop: ( event, ui ) ->

          draggableEl = ui.draggable
          $cliparts = $ '#cliparts'

          $ @
            .addClass( 'ui-state-highlight' )
            .html(draggableEl)

          existingAmount = $cliparts.find('.cliparts-item').length

          if existingAmount >= 9
            $cliparts.append '<div class="cliparts__item-wrapper ui-droppable"><span class="cliparts__item-wrapper-text">Добавить клипарт</span></div>'

) jQuery


# DOM ready
$(document).ready ->
  Events.init()
