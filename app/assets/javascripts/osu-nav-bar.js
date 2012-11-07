/**
 * Handles toggling the OSU nav bar navigation menu for small screens. Modified from the WordPress _s theme.
 */
jQuery( document ).ready( function( $ ) {
	var $masthead = $( '#osu-nav-bar-outer' ),
	    timeout = false;

	$.fn.smallMenu = function() {
		$masthead.find( '#osu-nav-primary' ).removeClass( 'osu-nav-bar-main-navigation' ).addClass( 'osu-nav-bar-small-navigation' );
		$masthead.find( '#osu-nav-primary h3' ).removeClass( 'visuallyhidden' ).addClass( 'menu-toggle' );

		$( '.menu-toggle' ).unbind( 'click' ).click( function() {
			$masthead.find( '.menu' ).toggle();
			$( this ).toggleClass( 'toggled-on' );
		} );
	};

	// Check viewport width on first load.
	if ( $( window ).width() < 500 )
		$.fn.smallMenu();

	// Check viewport width when user resizes the browser window.
	$( window ).resize( function() {
		var browserWidth = $( window ).width();

		if ( false !== timeout )
			clearTimeout( timeout );

		timeout = setTimeout( function() {
			if ( browserWidth < 500 ) {
				$.fn.smallMenu();
			} else {
				$masthead.find( '#osu-nav-primary' ).removeClass( 'osu-nav-bar-small-navigation' ).addClass( 'osu-nav-bar-main-navigation' );
				$masthead.find( '#osu-nav-primary h3' ).removeClass( 'menu-toggle' ).addClass( 'visuallyhidden' );
				$masthead.find( '.menu' ).removeAttr( 'style' );
			}
		}, 200 );
	} );
} );