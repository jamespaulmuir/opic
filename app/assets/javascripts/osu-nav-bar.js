/**
 * Handles toggling the OSU nav bar nav menu for small screens. Modified from the WordPress _s theme.
 */

if (Modernizr.mq('only all')) {

	jQuery( document ).ready( function( $ ) {
		var $masthead = $( '#osu-nav-bar-outer' ),
		    timeout = false;

		$.fn.smallMenu = function() {
			$masthead.find( '#osu-nav-primary h3' ).removeClass( 'visuallyhidden' ).addClass( 'menu-toggle' );
			$masthead.find( '#osu-nav-primary' ).removeClass( 'osu-nav-bar-main-navigation' ).addClass( 'osu-nav-bar-small-navigation' );

			$( '.menu-toggle' ).unbind( 'click' ).click( function() {
				$masthead.find( '.menu' ).toggle();
				$( this ).toggleClass( 'toggled-on' );
			} );
		};

		$.fn.abbreviation = function() {
			$( '#osu-site-title a:first-child' ).text('OSU');
		};

		// Check viewport width on first load.
		if ( $( window ).width() < 979 )
			$.fn.smallMenu();

		if ( $( window ).width() < 500 )
			$.fn.abbreviation();

		// Check viewport width when user resizes the browser window.
		$( window ).resize( function() {
			var browserWidth = $( window ).width();

			if ( false !== timeout )
				clearTimeout( timeout );

			timeout = setTimeout( function() {
				if ( browserWidth < 979 ) {
					$.fn.smallMenu();
				} else {
					$masthead.find( '#osu-nav-primary' ).removeClass( 'osu-nav-bar-small-navigation' ).addClass( 'osu-nav-bar-main-navigation' );
					$masthead.find( '#osu-nav-primary h3' ).removeClass( 'menu-toggle' ).addClass( 'visuallyhidden' );
					$masthead.find( '.menu' ).removeAttr( 'style' );
				}

				if ( browserWidth < 500 ) {
					$.fn.abbreviation();
				} else {
					$( '#osu-site-title a:first-child' ).text('The Ohio State University');
				}

			}, 200 );
		} );
	} );

}