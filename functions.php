<?php
function wordcamp_japan_theme_css() {
  wp_enqueue_style( 'parent-style', get_template_directory_uri() . '/style.css' );
  wp_enqueue_style( 'child-style', get_stylesheet_directory_uri() . '/css/wordcamp-japan-theme.css', array('parent-style'));
}
add_action( 'wp_enqueue_scripts', 'wordcamp_japan_theme_css' );
