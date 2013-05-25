$(function(){ //DOM Ready

  // Transpose a 2-dimensional array. Assumes that the array is rectangular -
  // probably won't do the right thing if some rows are shorter.
  function transpose(a) {
    // Treat 'a' as a column-first array, 'b' as a row-first array
    var cols = a.length;
    var rows = a[0].length;
    var b = new Array(rows);
    var i, j;

    for (i = 0; i < rows; i++) {
      b[i] = new Array(cols);
      for (j = 0; j < cols; j++) {
        b[i][j] = a[j][i];
      }
    }
    return b;
  }


  var handsontableOutputBinding = new Shiny.OutputBinding();
  $.extend(handsontableOutputBinding, {
    find: function(scope) {
      return $(scope).find('.shiny-handsontable-output');
    },
    onValueError: function(el, err) {
      exports.unbindAll(el);
      this.renderError(el, err);
    },
    renderValue: function(el, data) {
      $(el).handsontable({
        colHeaders: data.colnames,
        rowHeaders: data.rownames,
        height: 400
      });

      var ht = $(el).handsontable('getInstance');

      // Data is sent in column-first format, but handsontable wants data in
      // row-first format
      ht.loadData(transpose(data.values));
    }
  });
  Shiny.outputBindings.register(handsontableOutputBinding, 'shiny.handsontableOutput');

});
