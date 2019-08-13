  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [0,1,2,3,4,5,6,7,8,9];

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0],targetIndex, blobUrl));
      fileIndex.shift();
      $('.js-file_group').hide();
      $('#image-box').append(buildFileFieldFirst(fileIndex[0]));
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[8] + 1);
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().parent().data('index');
    $(this).parent().parent().remove();
    $(`div[data-index="${targetIndex}"]`).remove();
});
