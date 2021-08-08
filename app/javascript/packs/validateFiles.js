function validateFiles(inputFile) {
    const maxExceededMessage = "This file exceeds the maximum allowed file size (5 MB)";
    const extErrorMessage = "Only image file with extension: .jpg, .jpeg, .gif or .png is allowed";
    const allowedExtension = ["jpg", "jpeg", "gif", "png"];
  
    const extName;
    const maxFileSize = $(inputFile).data('max-file-size');
    const sizeExceeded = false;
    const extError = false;
  
    $.each(inputFile.files, function() {
      if (this.size && maxFileSize && this.size > parseInt(maxFileSize)) {sizeExceeded=true;};
      extName = this.name.split('.').pop();
      if ($.inArray(extName, allowedExtension) == -1) {extError=true;};
    });
    if (sizeExceeded) {
      window.alert(maxExceededMessage);
      $(inputFile).val('');
    };
  
    if (extError) {
      window.alert(extErrorMessage);
      $(inputFile).val('');
    };
}