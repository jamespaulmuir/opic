/**
 * Handles toggling the OSU nav bar nav menu for small screens. Modified from the WordPress _s theme.
 */

if (Modernizr.mq('only all')) {

	jQuery( document ).ready( function( $ ) {
		var $masthead = $( '#osu-nav-bar-outer' ),
		    timeout = false;

		$.fn.OSUsmallMenu = function() {
			$masthead.find( '#osu-nav-primary h3' ).removeClass( 'visuallyhidden' ).addClass( 'osu-nav-menu-toggle' );
			$masthead.find( '#osu-nav-primary' ).removeClass( 'osu-nav-main-navigation' ).addClass( 'osu-nav-small-navigation' );

			$( '.osu-nav-menu-toggle' ).unbind( 'click' ).click( function() {
				$masthead.find( '.osu-nav-menu' ).toggle();
				$( this ).toggleClass( 'toggled-on' );
			} );
		};

		// Check viewport width on first load.
		if ( $( window ).width() < 800 )
			$.fn.OSUsmallMenu();

		// Check viewport width when user resizes the browser window.
		$( window ).resize( function() {
			var browserWidth = $( window ).width();

			if ( false !== timeout )
				clearTimeout( timeout );

			timeout = setTimeout( function() {
				if ( browserWidth < 800 ) {
					$.fn.OSUsmallMenu();
				} else {
					$masthead.find( '#osu-nav-primary' ).removeClass( 'osu-nav-small-navigation' ).addClass( 'osu-nav-main-navigation' );
					$masthead.find( '#osu-nav-primary h3' ).removeClass( 'osu-nav-menu-toggle' ).addClass( 'visuallyhidden' );
					$masthead.find( '.osu-nav-menu' ).removeAttr( 'style' );
				}

			}, 200 );
		} );
	} );

}