const insertBar = (value, percent, iterator) => {
  const ProgressBar = require('progressbar.js')
  const bar = new ProgressBar.Line('#container-'+iterator, {
    easing: 'easeInOut',
    color: '#FFEA82',
    strokeWidth: 2,
    text: { value, alignToBottom: true, style: { color: '#000000' } }
  })
  bar.animate(percent)
}
window.insertBar = insertBar
