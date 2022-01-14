module.exports = {
  plugins: [
    "postcss-import",
    
    "postcss-nesting",
    require('tailwindcss/nesting')(require('postcss-nesting')),
    "tailwindcss",
    "postcss-nested",
    "autoprefixer"
   
  ]
}
