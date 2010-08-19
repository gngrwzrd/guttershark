package gs.util 
{

	/**
	 * The HTMLUtils class contains helpers for HTML.
	 */
	public class HTMLUtils
	{
		
		/**
		 * Convert special characters to HTML entity equivalents.
		 * See the source of this class for all of the characters
		 * that are converted.
		 * 
		 * <p>Originally from http://code.google.com/p/pixelrevisionutilities/</p>
		 * 
		 * @param t A string of HTML.
		 */
		public static function htmlEntities(t:String):String
		{
			//List taken from : http://www.w3schools.com/tags/ref_entities.asp and http://www.evolt.org/entities
			//HTML Reserved
			t=t.replace(/&quot;/gi,"&#34;");
			t=t.replace(/&amp;/gi,"&#38;");
			t=t.replace(/&apos;/gi,"&#39;");
			t=t.replace(/&lt;/gi,"&#60;");
			t=t.replace(/&gt;/gi,"&#62;");
			//SO 8859-1 Symbols
			t=t.replace(/&nbsp;/gi,"&#160;");
			t=t.replace(/&iexcl;/gi,"&#161;");
			t=t.replace(/&cent;/gi,"&#162;");
			t=t.replace(/&pound;/gi,"&#163;");
			t=t.replace(/&curren;/gi,"&#164;");
			t=t.replace(/&yen;/gi,"&#165;");
			t=t.replace(/&brvbar;/gi,"&#166;");
			t=t.replace(/&sect;/gi,"&#167;");
			t=t.replace(/&uml;/gi,"&#168;");
			t=t.replace(/&copy;/gi,"&#169;");
			t=t.replace(/&ordf;/gi,"&#170;");
			t=t.replace(/&laquo;/gi,"&#171;");
			t=t.replace(/&not;/gi,"&#172;");
			t=t.replace(/&shy;/gi,"&#173;");
			t=t.replace(/&reg;/gi,"&#174;");
			t=t.replace(/&macr;/gi,"&#175;");
			t=t.replace(/&deg;/gi,"&#176;");
			t=t.replace(/&plusmn;/gi,"&#177;");
			t=t.replace(/&sup2;/gi,"&#178;");
			t=t.replace(/&sup3;/gi,"&#179;");
			t=t.replace(/&acute;/gi,"&#180;");
			t=t.replace(/&micro;/gi,"&#181;");
			t=t.replace(/&para;/gi,"&#182;");
			t=t.replace(/&middot;/gi,"&#183;");
			t=t.replace(/&cedil;/gi,"&#184;");
			t=t.replace(/&sup1;/gi,"&#185;");
			t=t.replace(/&ordm;/gi,"&#186;");
			t=t.replace(/&raquo;/gi,"&#187;");
			t=t.replace(/&frac14;/gi,"&#188;");
			t=t.replace(/&frac12;/gi,"&#189;");
			t=t.replace(/&frac34;/gi,"&#190;");
			t=t.replace(/&iquest;/gi,"&#191;");
			t=t.replace(/&times;/gi,"&#215;");
			t=t.replace(/&divide;/gi,"&#247;");
			// SO 8859-1 Characters
			t=t.replace(/&Agrave;/gi,"&#192;");
			t=t.replace(/&Aacute;/gi,"&#193;");
			t=t.replace(/&Acirc;/gi,"&#194;");
			t=t.replace(/&Atilde;/gi,"&#195;");
			t=t.replace(/&Auml;/gi,"&#196;");
			t=t.replace(/&Aring;/gi,"&#197;");
			t=t.replace(/&AElig;/gi,"&#198;");
			t=t.replace(/&Ccedil;/gi,"&#199;");
			t=t.replace(/&Egrave;/gi,"&#200;");
			t=t.replace(/&Eacute;/gi,"&#201;");
			t=t.replace(/&Ecirc;/gi,"&#202;");
			t=t.replace(/&Euml;/gi,"&#203;");
			t=t.replace(/&Igrave;/gi,"&#204;");
			t=t.replace(/&Iacute;/gi,"&#205;");
			t=t.replace(/&Icirc;/gi,"&#206;");
			t=t.replace(/&Iuml;/gi,"&#207;");
			t=t.replace(/&ETH;/gi,"&#208;");
			t=t.replace(/&Ntilde;/gi,"&#209;");
			t=t.replace(/&Ograve;/gi,"&#210;");
			t=t.replace(/&Oacute;/gi,"&#211;");
			t=t.replace(/&Ocirc;/gi,"&#212;");
			t=t.replace(/&Otilde;/gi,"&#213;");
			t=t.replace(/&Ouml;/gi,"&#214;");
			t=t.replace(/&Oslash;/gi,"&#216;");
			t=t.replace(/&Ugrave;/gi,"&#217;");
			t=t.replace(/&Uacute;/gi,"&#218;");
			t=t.replace(/&Ucirc;/gi,"&#219;");
			t=t.replace(/&Uuml;/gi,"&#220;");
			t=t.replace(/&Yacute;/gi,"&#221;");
			t=t.replace(/&THORN;/gi,"&#222;");
			t=t.replace(/&szlig;/gi,"&#223;");
			t=t.replace(/&agrave;/gi,"&#224;");
			t=t.replace(/&aacute;/gi,"&#225;");
			t=t.replace(/&acirc;/gi,"&#226;");
			t=t.replace(/&atilde;/gi,"&#227;");
			t=t.replace(/&auml;/gi,"&#228;");
			t=t.replace(/&aring;/gi,"&#229;");
			t=t.replace(/&aelig;/gi,"&#230;");
			t=t.replace(/&ccedil;/gi,"&#231;");
			t=t.replace(/&egrave;/gi,"&#232;");
			t=t.replace(/&eacute;/gi,"&#233;");
			t=t.replace(/&ecirc;/gi,"&#234;");
			t=t.replace(/&euml;/gi,"&#235;");
			t=t.replace(/&igrave;/gi,"&#236;");
			t=t.replace(/&iacute;/gi,"&#237;");
			t=t.replace(/&icirc;/gi,"&#238;");
			t=t.replace(/&iuml;/gi,"&#239;");
			t=t.replace(/&eth;/gi,"&#240;");
			t=t.replace(/&ntilde;/gi,"&#241;");
			t=t.replace(/&ograve;/gi,"&#242;");
			t=t.replace(/&oacute;/gi,"&#243;");
			t=t.replace(/&ocirc;/gi,"&#244;");
			t=t.replace(/&otilde;/gi,"&#245;");
			t=t.replace(/&ouml;/gi,"&#246;");
			t=t.replace(/&oslash;/gi,"&#248;");
			t=t.replace(/&ugrave;/gi,"&#249;");
			t=t.replace(/&uacute;/gi,"&#250;");
			t=t.replace(/&ucirc;/gi,"&#251;");
			t=t.replace(/&uuml;/gi,"&#252;");
			t=t.replace(/&yacute;/gi,"&#253;");
			t=t.replace(/&thorn;/gi,"&#254;");
			t=t.replace(/&yuml;/gi,"&#255;");
			// Markup-Significant and Internationalization Characters taken from: http://www.evolt.org/entities
			t=t.replace(/&OElig;/gi,"&#338;");  // 	Œ 	Œ 	latin capital ligature OE
			t=t.replace(/&oelig;/gi,"&#339;");  // 	œ 	œ 	latin small ligature oe
			t=t.replace(/&Scaron;/gi,"&#352;");  // 	Š 	Š 	latin capital letter S with caron
			t=t.replace(/&scaron;/gi,"&#353;");  // 	š 	š 	latin small letter s with caron
			t=t.replace(/&Yuml;/gi,"&#376;");  // 	Ÿ 	Ÿ 	latin capital letter Y with diaeresis
			t=t.replace(/&circ;/gi,"&#710;");  // 	ˆ 	ˆ 	modifier letter circumflex accent
			t=t.replace(/&tilde;/gi,"&#732;");  // 	˜ 	˜ 	small tilde
			t=t.replace(/&ensp;/gi,"&#8194;");  // 	  	  	en space
			t=t.replace(/&emsp;/gi,"&#8195;");  //	  	  	em space
			t=t.replace(/&thinsp;/gi,"&#8201;");  // 	  	  	thin space
			t=t.replace(/&zwnj;/gi,"&#8204;");  // 	‌ 	‌ 	zero width non-joiner
			t=t.replace(/&zwj;/gi,"&#8205;");  // 	‍ 	‍ 	zero width joiner
			t=t.replace(/&lrm;/gi,"&#8206;");  // 	‎ 	‎ 	left-to-right mark
			t = t.replace(/&rlm;/gi,"&#8207;");  // 	‏ 	‏ 	right-to-left mark
			t=t.replace(/&ndash;/gi,"&#8211;");  // 	– 	– 	en dash
			t=t.replace(/&mdash;/gi,"&#8212;");  // 	— 	— 	em dash
			t=t.replace(/&lsquo;/gi,"&#8216;");  // 	‘ 	‘ 	left single quotation mark
			t=t.replace(/&rsquo;/gi,"&#8217;");  // 	’ 	’ 	right single quotation mark
			t=t.replace(/&sbquo;/gi,"&#8218;");  // 	‚ 	‚ 	single low-9 quotation mark
			t=t.replace(/&ldquo;/gi,"&#8220;");  // 	“ 	“ 	left double quotation mark
			t=t.replace(/&rdquo;/gi,"&#8221;");  // 	” 	” 	right double quotation mark
			t=t.replace(/&bdquo;/gi,"&#8222;");  // 	„ 	„ 	double low-9 quotation mark
			t=t.replace(/&dagger;/gi,"&#8224;");  // 	† 	† 	dagger
			t=t.replace(/&Dagger;/gi,"&#8225;");  // 	‡ 	‡ 	double dagger
			t=t.replace(/&permil;/gi,"&#8240;");  // 	‰ 	‰ 	per mille sign
			t=t.replace(/&lsaquo;/gi,"&#8249;");  // 	‹ 	‹ 	single left-pointing angle quotation mark
			t=t.replace(/&rsaquo;/gi,"&#8250;");  // 	› 	› 	single right-pointing angle quotation mark
			t=t.replace(/&euro;/gi,"&#8364;");  // 	€ 	€ 	euro sign
			//Math and greek symbols taken from: http://www.evolt.org/entities
			t=t.replace(/&fnof;/gi,"&#402;");   //  	ƒ  	ƒ  	latin small f with hook
			t=t.replace(/&Alpha;/gi,"&#913;");   // 	Α 	Α 	greek capital letter alpha
			t=t.replace(/&Beta;/gi,"&#914;");   // 	Β 	Β 	greek capital letter beta
			t=t.replace(/&Gamma;/gi,"&#915;");   // 	Γ 	Γ 	greek capital letter gamma
			t=t.replace(/&Delta;/gi,"&#916;");   // 	Δ 	Δ 	greek capital letter delta
			t=t.replace(/&Epsilon;/gi,"&#917;");   // 	Ε 	Ε 	greek capital letter epsilon
			t=t.replace(/&Zeta;/gi,"&#918;");   // 	Ζ 	Ζ 	greek capital letter zeta
			t=t.replace(/&Eta;/gi,"&#919;");   // 	Η 	Η 	greek capital letter eta
			t=t.replace(/&Theta;/gi,"&#920;");   // 	Θ 	Θ 	greek capital letter theta
			t=t.replace(/&Iota;/gi,"&#921;");   //  	Ι 	Ι 	greek capital letter iota
			t=t.replace(/&Kappa;/gi,"&#922;");   //  	Κ 	Κ 	greek capital letter kappa
			t=t.replace(/&Lambda;/gi,"&#923;");   //  	Λ 	Λ 	greek capital letter lambda
			t=t.replace(/&Mu;/gi,"&#924;");   //  	Μ 	Μ 	greek capital letter mu
			t=t.replace(/&Nu;/gi,"&#925;");   //  	Ν 	Ν 	greek capital letter nu
			t=t.replace(/&Xi;/gi,"&#926;");   //  	Ξ 	Ξ 	greek capital letter xi
			t=t.replace(/&Omicron;/gi,"&#927;");   //  	Ο 	Ο 	greek capital letter omicron
			t=t.replace(/&Pi;/gi,"&#928;");   //  	Π 	Π 	greek capital letter pi
			t=t.replace(/&Rho;/gi,"&#929;");   //  	Ρ 	Ρ 	greek capital letter rho
			t=t.replace(/&Sigma;/gi,"&#931;");   //  	Σ 	Σ 	greek capital letter sigma
			t=t.replace(/&Tau;/gi,"&#932;");   //  	Τ 	Τ 	greek capital letter tau
			t=t.replace(/&Upsilon;/gi,"&#933;");   //Υ 	Υ 	greek capital letter upsilon
			t=t.replace(/&Phi;/gi,"&#934;");   //Φ 	Φ 	greek capital letter phi
			t=t.replace(/&Chi;/gi,"&#935;");   //Χ 	Χ 	greek capital letter chi
			t=t.replace(/&Psi;/gi,"&#936;");   //Ψ 	Ψ 	greek capital letter psi
			t=t.replace(/&Omega;/gi,"&#937;");   //Ω 	Ω 	greek capital letter omega
			t=t.replace(/&alpha;/gi,"&#945;");   //α 	α 	greek small letter alpha
			t=t.replace(/&beta;/gi,"&#946;");   //β 	β 	greek small letter beta
			t=t.replace(/&gamma;/gi,"&#947;");   //γ 	γ 	greek small letter gamma
			t=t.replace(/&delta;/gi,"&#948;");   //δ 	δ 	greek small letter delta
			t=t.replace(/&epsilon;/gi,"&#949;");   //ε 	ε 	greek small letter epsilon
			t=t.replace(/&zeta;/gi,"&#950;");   //ζ 	ζ 	greek small letter zeta
			t=t.replace(/&eta;/gi,"&#951;");   //η 	η 	greek small letter eta
			t=t.replace(/&theta;/gi,"&#952;");   //θ 	θ 	greek small letter theta
			t=t.replace(/&iota;/gi,"&#953;");   //ι 	ι 	greek small letter iota
			t=t.replace(/&kappa;/gi,"&#954;");   //κ 	κ 	greek small letter kappa
			t=t.replace(/&lambda;/gi,"&#955;");   //λ 	λ 	greek small letter lambda
			t=t.replace(/&mu;/gi,"&#956;");   //μ 	μ 	greek small letter mu
			t=t.replace(/&nu;/gi,"&#957;");   //ν 	ν 	greek small letter nu
			t=t.replace(/&xi;/gi,"&#958;");   //ξ 	ξ 	greek small letter xi
			t=t.replace(/&omicron;/gi,"&#959;");   //ο 	ο 	greek small letter omicron
			t=t.replace(/&pi;/gi,"&#960;");   //π 	π 	greek small letter pi
			t=t.replace(/&rho;/gi,"&#961;");   //ρ 	ρ 	greek small letter rho
			t=t.replace(/&sigmaf;/gi,"&#962;");   //ς 	ς 	greek small letter final sigma
			t=t.replace(/&sigma;/gi,"&#963;");   //σ 	σ 	greek small letter sigma
			t=t.replace(/&tau;/gi,"&#964;");   //τ 	τ 	greek small letter tau
			t=t.replace(/&upsilon;/gi,"&#965;");   //υ 	υ 	greek small letter upsilon
			t=t.replace(/&phi;/gi,"&#966;");   //φ 	φ 	greek small letter phi
			t=t.replace(/&chi;/gi,"&#967;");   //χ 	χ 	greek small letter chi
			t=t.replace(/&psi;/gi,"&#968;");   //ψ 	ψ 	greek small letter psi
			t=t.replace(/&omega;/gi,"&#969;");   //ω 	ω 	greek small letter omega
			t=t.replace(/&thetasym;/gi,"&#977;");   //ϑ 	ϑ 	greek small letter theta symbol
			t=t.replace(/&upsih;/gi,"&#978;");   //ϒ 	ϒ 	greek upsilon with hook symbol
			t=t.replace(/&piv;/gi,"&#982;");   //ϖ 	ϖ 	greek pi symbol
			t=t.replace(/&bull;/gi,"&#8226;");   //• 	• 	bullet
			t=t.replace(/&hellip;/gi,"&#8230;");   //… 	… 	horizontal ellipsis
			t=t.replace(/&prime;/gi,"&#8242;");   //′ 	′ 	primeminutes
			t=t.replace(/&Prime;/gi,"&#8243;");   //″ 	″ 	double prime
			t=t.replace(/&oline;/gi,"&#8254;");   //‾ 	‾ 	overline
			t=t.replace(/&frasl;/gi,"&#8260;");   //⁄ 	⁄ 	fraction slash
			t=t.replace(/&weierp;/gi,"&#8472;");   //℘ 	℘ 	script capital P
			t=t.replace(/&image;/gi,"&#8465;");   //ℑ 	ℑ 	blackletter capital I
			t=t.replace(/&real;/gi,"&#8476;");   //ℜ 	ℜ 	blackletter capital R
			t=t.replace(/&trade;/gi,"&#8482;");   //™ 	™ 	trade mark sign
			t=t.replace(/&alefsym;/gi,"&#8501;");   //ℵ 	ℵ 	alef symbol
			t=t.replace(/&larr;/gi,"&#8592;");   //← 	← 	leftwards arrow
			t=t.replace(/&uarr;/gi,"&#8593;");   //↑ 	↑ 	upwards arrow
			t=t.replace(/&rarr;/gi,"&#8594;");   //→ 	→ 	rightwards arrow
			t=t.replace(/&darr;/gi,"&#8595;");   //↓ 	↓ 	downwards arrow
			t=t.replace(/&harr;/gi,"&#8596;");   //↔ 	↔ 	left right arrow
			t=t.replace(/&crarr;/gi,"&#8629;");   //↵ 	↵ 	downwards arrow with corner leftwards
			t=t.replace(/&lArr;/gi,"&#8656;");   //⇐ 	⇐ 	leftwards double arrow
			t=t.replace(/&uArr;/gi,"&#8657;");   //⇑ 	⇑ 	upwards double arrow
			t=t.replace(/&rArr;/gi,"&#8658;");   //⇒ 	⇒ 	rightwards double arrow
			t=t.replace(/&dArr;/gi,"&#8659;");   //⇓ 	⇓ 	downwards double arrow
			t=t.replace(/&hArr;/gi,"&#8660;");   //⇔ 	⇔ 	left right double arrow
			t=t.replace(/&forall;/gi,"&#8704;");   //∀ 	∀ 	for all
			t=t.replace(/&part;/gi,"&#8706;");   //∂ 	∂ 	partial differential
			t=t.replace(/&exist;/gi,"&#8707;");   //∃ 	∃ 	there exists
			t=t.replace(/&empty;/gi,"&#8709;");   //∅ 	∅ 	empty set
			t=t.replace(/&nabla;/gi,"&#8711;");   //∇ 	∇ 	nabla
			t=t.replace(/&isin;/gi,"&#8712;");   //∈ 	∈ 	element of
			t=t.replace(/&notin;/gi,"&#8713;");   //∉ 	∉ 	not an element of
			t=t.replace(/&ni;/gi,"&#8715;");   //∋ 	∋ 	contains as member
			t=t.replace(/&prod;/gi,"&#8719;");   //∏ 	∏ 	n-ary product
			t=t.replace(/&sum;/gi,"&#8721;");   //∑ 	∑ 	n-ary sumation
			t=t.replace(/&minus;/gi,"&#8722;");   //− 	− 	minus sign
			t=t.replace(/&lowast;/gi,"&#8727;");   //∗ 	∗ 	asterisk operator
			t=t.replace(/&radic;/gi,"&#8730;");   //√ 	√ 	square root
			t=t.replace(/&prop;/gi,"&#8733;");   //∝ 	∝ 	proportional to
			t=t.replace(/&infin;/gi,"&#8734;");   //∞ 	∞ 	infinity
			t=t.replace(/&ang;/gi,"&#8736;");   //∠ 	∠ 	angle
			t=t.replace(/&and;/gi,"&#8743;");   //∧ 	∧ 	logical and
			t=t.replace(/&or;/gi,"&#8744;");   //∨ 	∨ 	logical or
			t=t.replace(/&cap;/gi,"&#8745;");   //∩ 	∩ 	intersection
			t=t.replace(/&cup;/gi,"&#8746;");   //∪ 	∪ 	union
			t=t.replace(/&int;/gi,"&#8747;");   //∫ 	∫ 	integral
			t=t.replace(/&there4;/gi,"&#8756;");   //∴ 	∴ 	therefore
			t=t.replace(/&sim;/gi,"&#8764;");   //∼ 	∼ 	tilde operator
			t=t.replace(/&cong;/gi,"&#8773;");   //≅ 	≅ 	approximately equal to
			t=t.replace(/&asymp;/gi,"&#8776;");   //≈ 	≈ 	almost equal to
			t=t.replace(/&ne;/gi,"&#8800;");   //≠ 	≠ 	not equal to
			t=t.replace(/&equiv;/gi,"&#8801;");   //≡ 	≡ 	identical to
			t=t.replace(/&le;/gi,"&#8804;");   //≤ 	≤ 	less-than or equal to
			t=t.replace(/&ge;/gi,"&#8805;");   //≥ 	≥ 	greater-than or equal to
			t=t.replace(/&sub;/gi,"&#8834;");   //⊂ 	⊂ 	subset of
			t=t.replace(/&sup;/gi,"&#8835;");   //⊃ 	⊃ 	superset of
			t=t.replace(/&nsub;/gi,"&#8836;");   //⊄ 	⊄ 	not a subset of
			t=t.replace(/&sube;/gi,"&#8838;");   //⊆ 	⊆ 	subset of or equal to
			t=t.replace(/&supe;/gi,"&#8839;");   //⊇ 	⊇ 	superset of or equal to
			t=t.replace(/&oplus;/gi,"&#8853;");   //⊕ 	⊕ 	circled plus
			t=t.replace(/&otimes;/gi,"&#8855;");   //⊗ 	⊗ 	circled times
			t=t.replace(/&perp;/gi,"&#8869;");   //⊥ 	⊥ 	up tack
			t=t.replace(/&sdot;/gi,"&#8901;");   //⋅ 	⋅ 	dot operator
			t=t.replace(/&lceil;/gi,"&#8968;");   //⌈ 	⌈ 	left ceiling
			t=t.replace(/&rceil;/gi,"&#8969;");   //⌉ 	⌉ 	right ceiling
			t=t.replace(/&lfloor;/gi,"&#8970;");   //⌊ 	⌊ 	left floor
			t=t.replace(/&rfloor;/gi,"&#8971;");   //⌋ 	⌋ 	right floor
			t=t.replace(/&lang;/gi,"&#9001;");   //〈 	〈 	left-pointing angle bracket
			t=t.replace(/&rang;/gi,"&#9002;");   //〉 	〉 	right-pointing angle bracket
			t=t.replace(/&loz;/gi,"&#9674;");   //◊ 	◊ 	lozenge
			t=t.replace(/&spades;/gi,"&#9824;");   //♠ 	♠ 	black spade suit
			t=t.replace(/&clubs;/gi,"&#9827;");   //♣ 	♣ 	black club suit
			t=t.replace(/&hearts;/gi,"&#9829;");   //♥ 	♥ 	black heart suit
			t=t.replace(/&diams;/gi,"&#9830;");   //♦ 	♦ 	black diamond suit
			return t;
		}
	}
}