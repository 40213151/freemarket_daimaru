$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (num, index, url)=> {
    const html =
                  `<li class="sell-upload-item" data-index="${num}">
                     <figure class="sell-upload-figure squarw">
                       <img data-index="${index}" src="${url}">
                     </figure>
                     <div class="sell-upload-button">
                       <label class="sell-upload-edit a" for="item_images_attributes_${num}_image">編集</label>
                       <input class="js-file sell-upload-container__drop-box__file" type="file"
                       name="item[images_attributes][${num}][image]"
                       id="item_images_attributes_${num}_image">
                       <a class="a js-remove">削除</a>
                     </div>
                   </li>`
    return html;
  }

  const buildFileFieldFirst = (num)=>{
    const html =
        `<div  class="js-file_group" data-index="${num}">
                    <label class="sell-upload-container__drop-box" for="item_images_attributes_${num}_image">Image</label>
                    <input class="js-file sell-upload-container__drop-box__file" type="file"
                    name="item[images_attributes][${num}][image]"
                    id="item_images_attributes_${num}_image">
          </div>`;
    return html
  }
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [0,1,2,3,4,5,6,7,8,9];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  console.log(lastIndex);
  fileIndex.splice(0, lastIndex);
  console.log(fileIndex)
  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // console.log(blobUrl)

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      // console.log('0')
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0],targetIndex, blobUrl));
      // $('#previews').append(buildImg(targetIndex, blobUrl));
      fileIndex.shift();
      $('.js-file_group').hide();
      $('#image-box').append(buildFileFieldFirst(fileIndex[0]));
      // $('.js-file_group').animate({maxWidth: '-=20px'});
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[8] + 1);
      // console.log(fileIndex);
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().parent().data('index');
    console.log(targetIndex);
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input#${targetIndex}.hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().parent().remove();
    $(`div[data-index="${targetIndex}"]`).remove();
    // 画像入力欄が0個にならないようにしておく
    // if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});
