const insertBar = (value, progress, iterator) => {
  const ProgressBar = require('progressbar.js')
  const bar = new ProgressBar.Line('#container-'+iterator, {
    easing: 'easeInOut',
    color: getColor(1 - progress),
    strokeWidth: 2,
    trailColor: '#eeeeee',
    trailWidth: 1,
  })
  bar.animate(progress)
}
window.insertBar = insertBar

// source: https://stackoverflow.com/questions/7128675/from-green-to-red-color-depend-on-percentage
const getColor = (value) => {
  //value from 0 to 1
  const hue=((1-value)*120).toString(10);
  return ["hsl(",hue,",100%,50%)"].join("");
}
