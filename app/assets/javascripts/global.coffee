jQuery ->
  addresses = $('#addresses')

  addresses.on 'cocoon:before-insert', (e, el_to_add) ->
    el_to_add.fadeIn(1000)