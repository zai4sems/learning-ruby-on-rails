jQuery ->
    states = $('#recipe_ingredient_id').html()
    $('#ingredient_id').change ->
        country = $('#ingredient_name :selected').text()
        options = $(states).filter("optgroup[label='#{country}']").html()
        if options
            $('#recipe_ingredient_id').html(options)
            $('#recipe_ingredient_id').parent().show()
        else
            $('#recipe_ingredient_id').empty()
            $('#recipe_ingredient_id').parent().hide()