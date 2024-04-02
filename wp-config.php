<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'rbn' );

/** Database password */
define( 'DB_PASSWORD', 'informatica' );

/** Database hostname */
define( 'DB_HOST', '172.31.80.12' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          '@B?$%,fE_Q](3v82yz#ham4Wpmd,@b=pCjj7d4:^Y!Wp&9hHJF:aX]}N lrzu|*<' );
define( 'SECURE_AUTH_KEY',   'kBeBm39JAC$|OiD9HOns~i^F.r*rR )RfuT-b1y@L?na)Uv,(X=4Xs:N et|lp <' );
define( 'LOGGED_IN_KEY',     '9i$v}XwVMi%$bbC13BR2z&mjKcTIl<V]%*FXi`3|aH]dw$%Q]<H35cM?aW0q>2Dk' );
define( 'NONCE_KEY',         '9NsH,39fnP(X3dUE<qaPH}fjd]kV0{#CrJ.JYldO>Pq7[t@<5sY-BI;8koA{:H[R' );
define( 'AUTH_SALT',         '~ F=ozCP ta~!ZUq6;%:`#DZj<U1De- x-j9cI&O=26+|Bi(ez_3P%{+9QS3&b~p' );
define( 'SECURE_AUTH_SALT',  'D|Y3mk$pe?,k(,KDfoa;<1f;?A=ps0fMQoVO=0tTY7b..sUy<(?*iE|CMfLm,5GH' );
define( 'LOGGED_IN_SALT',    ',2zUuk+Iqbx]A d$OmR5jRwv)WFq{Rjb*`{bmkR;qLi{jTb%J6d[g>^f,d/,P;av' );
define( 'NONCE_SALT',        '5OQF5NuVoH:)<F^L&pZs(-pRvjy{.%p:V]Q/?qq5.!V)9=]>sfaymud|4+Sz,n=j' );
define( 'WP_CACHE_KEY_SALT', 'X@#;$B.KtvaSrrg?j|7zejNsb]1[kDZF,w^9JX=8E^_5N9}v[V=2Q+>z_g~`L^_,' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
