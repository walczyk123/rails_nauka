const {environment} = require('@rails/webpacker')
const webpack = require('webpack')
environment.plugins.prepend('Provide', new webpack.ProwidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    })
)
module.exports = environment
