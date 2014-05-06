class Dashing.Codeclimate extends Dashing.Widget

  @accessor 'arrow', ->
    if @get('last')
      if parseFloat(@get('current')) == parseFloat(@get('last'))
        'icon-minus'
      else
        if parseFloat(@get('current')) > parseFloat(@get('last')) then 'icon-arrow-up' else 'icon-arrow-down'

  @accessor 'value', ->
    if parseFloat(@get('current')) > 3.5 then 'value value-dark_green'
    else if parseFloat(@get('current')) >= 2.6 and parseFloat(@get('current')) <= 3.5 then 'value value-light_green'
    else if parseFloat(@get('current')) >= 1.6 and parseFloat(@get('current')) <= 2.5 then 'value value-yellow'
    else if parseFloat(@get('current')) >= 0.6 and parseFloat(@get('current')) <= 1.5 then 'value value-orange'
    else if parseFloat(@get('current')) > 0 and parseFloat(@get('current')) <= 0.5 then 'value value-red'
