const thumbnailPic = document.querySelector('.listing-show-image-thumbnail-container')
const mainPic = document.querySelector('.listing-show-image-main')
thumbnailPic.addEventListener('click', (p) => {
  const target = p.target.closest('.listing-show-image-thumbnail');
  if (!target) return
  const src = target.src;
  mainPic.src = src;
})