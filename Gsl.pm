package Gsl;

use strict;
no strict 'refs';
use Carp;
use vars qw($VERSION %EXPORT_TAGS @ISA @EXPORT @EXPORT_OK $AUTOLOAD);

require Exporter;
require DynaLoader;
require AutoLoader;

@ISA = qw(Exporter DynaLoader);
@EXPORT = ();
%EXPORT_TAGS = (
		Airy  =>	[ qw( airy_Ai_e airy_Bi_e airy_Ai_scaled_e airy_Bi_scaled_e
				airy_Ai_deriv_e airy_Bi_deriv_e airy_Ai_deriv_scaled_e airy_Bi_deriv_scaled_e
				airy_zero_Ai_e airy_zero_Ai airy_zero_Bi_e airy_zero_Bi
				airy_zero_Ai_deriv_e airy_zero_Ai_deriv airy_zero_Bi_deriv_e airy_zero_Bi_deriv
				) ],
		Bessel=>	[ qw( bessel_I0_e bessel_I0_scaled_e bessel_I1_e bessel_I1_scaled_e bessel_In_array
				bessel_In_e bessel_In_scaled_array bessel_In_scaled_e bessel_Inu_e
				bessel_Inu_scaled_e bessel_J0_e bessel_J1_e bessel_Jn_array
				bessel_Jn_e bessel_Jnu_e bessel_K0_e bessel_K0_scaled_e
				bessel_K1_e bessel_K1_scaled_e bessel_Kn_array bessel_Kn_e
				bessel_Kn_scaled_array bessel_Kn_scaled_e bessel_Knu_e bessel_Knu_scaled_e
				bessel_Y0_e bessel_Y1_e bessel_Yn_array bessel_Yn_e
				bessel_Ynu_e bessel_i0_scaled_e bessel_i1_scaled_e bessel_i2_scaled_e
				bessel_il_scaled_array bessel_il_scaled_e bessel_j0_e bessel_j1_e
				bessel_j2_e bessel_jl_array bessel_jl_e bessel_k0_scaled_e
				bessel_k1_scaled_e bessel_k2_scaled_e bessel_kl_scaled_array bessel_kl_scaled_e
				bessel_lnKnu_e bessel_y0_e bessel_y1_e bessel_y2_e
				bessel_yl_array bessel_yl_e bessel_zero_J0_e bessel_zero_J1_e
				bessel_zero_Jnu_e result_smash_e ) ] ,
		Clausen=> 	[ qw( clausen_e ) ],
		Coulomb=>	[ qw( hydrogenicR_1_e hydrogenicR_e hydrogenicR coulomb_CL_e coulomb_CL_list ) ],
		Coupling=>	[ qw( coupling_3j_e coupling_3j coupling_6j_e coupling_6j coupling_9j_e coupling_9j ) ],
		Dawson  =>	[ qw( dawson_e dawson ) ], 
		Debye   =>	[ qw( debye_1_e debye_1 debye_2_e debye_2 debye_3_e debye_3 debye_4_e debye_4 ) ],
		Dilog   =>	[ qw( dilog_e dilog complex_dilog_e  ) ],
		Elementary =>	[ qw( multiply_e multiply multiply_err_e ) ],
		EllipticInt =>  [ qw( ell_Kcomp_e ell_Kcomp ell_Ecomp_e ell_Ecomp ell_F_e ell_F 
				ell_E_e ell_E ell_P_e ell_P ell_D_e ell_D ell_RC_e ell_RC 
				ell_RD_e ell_RD ell_RF_e ell_RF ell_RJ_e ell_RJ ) ],
		EllipticJac =>  [ qw( elljac_e ) ],
		Error => 	[ qw( erfc_e erfc log_erfc_e log_erfc erf_e erf erf_Z_e erf_Q_e erf_Z erf_Q ) ],
		Exp   => 	[ qw( exp_e exp exp_e10_e exp_mult_e exp_mult exp_mult_e10_e expm1_e expm1
				 exprel_e exprel exprel_2_e exprel_2 exprel_n_e exprel_n exp_err_e exp_err_e10_e 
				 exp_mult_err_e exp_mult_err_e10_e ) ],
		ExpInt =>	[ qw( exp_E1_e exp_E1 exp_E2_e exp_E2 exp_Ei_e exp_Ei Shi_e Shi Chi_e Chi 
				exp_3_e exp_3 Si_e Si Ci_e Ci atan_e atan ) ],
		FermiDirac =>	[ qw( fermi_dirac_m1_e fermi_dirac_m1 fermi_dirac_0_e fermi_dirac_0 fermi_dirac_1_e
				 fermi_dirac_1 fermi_dirac_2_e fermi_dirac_2 fermi_dirac_int_e fermi_dirac_int
				 fermi_dirac_mhalf_e fermi_dirac_mhalf fermi_dirac_half_e fermi_dirac_half
				 fermi_dirac_3half_e fermi_dirac_3half fermi_dirac_inc_0_e fermi_dirac_inc_0 ) ],
		Gamma =>        [ qw( lngamma_e lngamma lngamma_sgn_e 
				gamma_e gamma gammastar_e gammastar gammainv_e
			 	gammainv lngamma_complex_e taylorcoeff_e taylorcoeff
				fact_e fact doublefact_e doublefact lnfact_e lnfact
				lndoublefact_e lndoublefact lnchoose_e lnchoose 
				choose_e choose lnpoch_e lnpoch lnpoch_sgn_e poch_e
				poch pochrel_e pochrel gamma_inc_Q_e gamma_inc_Q
				gamma_inc_P_e gamma_inc_P lnbeta_e lnbeta beta_e
				beta beta_inc_e beta_inc ) ] ,
		Gegenbauer =>   [ qw( gegenpoly_1_e gegenpoly_2_e gegenpoly_3_e gegenpoly_1 gegenpoly_2 gegenpoly_3
				gegenpoly_n_e gegenpoly_n gegenpoly_array ) ],
		HyperGeometric=>[ qw( hyperg_0F1_e hyperg_0F1 hyperg_1F1_int_e hyperg_1F1_int hyperg_1F1_e hyperg_1F1 
				hyperg_U_int_e hyperg_U_int hyperg_U_int_e10_e hyperg_U_e hyperg_U hyperg_U_e10_e 
				hyperg_2F1_e hyperg_2F1 hyperg_2F1_conj_e hyperg_2F1_conj hyperg_2F1_renorm_e
				hyperg_2F1_renorm hyperg_2F1_conj_renorm_e hyperg_2F1_conj_renorm hyperg_2F0_e hyperg_2F0 ) ],
		Laguerre =>	[ qw( laguerre_1_e laguerre_2_e laguerre_3_e laguerre_1 laguerre_2 laguerre_3 laguerre_n_e laguerre_n ) ],
		Lambert	 =>	[ qw( lambert_W0 lambert_Wm1 )],
		Legendre =>     [ qw( legendre_Pl_e legendre_Pl legendre_Pl_array legendre_P1_e legendre_P2_e legendre_P3_e legendre_P1
				legendre_P2 legendre_P3 legendre_Q0_e legendre_Q0 legendre_Q1_e legendre_Q1 legendre_Ql_e legendre_Ql 
				legendre_Plm_e legendre_Plm legendre_Plm_array legendre_sphPlm_e legendre_sphPlm legendre_sphPlm_array 
				legendre_array_size conicalP_half_e conicalP_half conicalP_mhalf_e conicalP_mhalf conicalP_0_e 
				conicalP_0 conicalP_1_e conicalP_1 conicalP_sph_reg_e conicalP_sph_reg conicalP_cyl_reg_e 
				conicalP_cyl_reg legendre_H3d_0_e legendre_H3d_0 legendre_H3d_1_e legendre_H3d_1 legendre_H3d_e 
				legendre_H3d legendre_H3d_array ) ],
		Log	=>	[ qw( log_e log log_abs_e log_abs complex_log_e log_1plusx_e log_1plusx log_1plusx_mx_e log_1plusx_mx ) ],
		Power 	=>	[ qw( pow_int_e pow_int ) ],
		Psi	=>	[ qw( psi_int_e psi_int psi_e psi psi_1piy_e psi_1piy psi_1_int_e psi_1_int psi_n_e psi_n )],
		Synchrotron =>  [ qw( synchrotron_1_e synchrotron_1 synchrotron_2_e synchrotron_2 ) ],
		Transport =>	[ qw( transport_2_e transport_2 transport_3_e transport_3 transport_4_e transport_4 transport_5_e transport_5 )],
		Trig	=> 	[ qw( sin_e sin cos_e cos hypot_e hypot complex_sin_e complex_cos_e 
				complex_logsin_e sinc_e sinc lnsinh_e lnsinh lncosh_e lncosh 
				polar_to_rect rect_to_polar sin_err_e cos_err_e angle_restrict_symm_e 
				angle_restrict_symm angle_restrict_pos_e angle_restrict_pos 
				angle_restrict_symm_err_e angle_restrict_pos_err_e )],
		Zeta	=>	[ qw( zeta_int_e zeta_int zeta_e zeta hzeta_e hzeta eta_int_e eta_int eta_e eta )],
		SpecialFunction => [ qw() ]

	);

# maximum smarts, minimum effort
# fills in EXPORT_OK with all functions, then fills in :SpecialFunction tag with
# them all too, so they can all be slurped in at once
for ( keys %EXPORT_TAGS ){
        push(@EXPORT_OK, @{$EXPORT_TAGS{$_}} );
	push(@{ $EXPORT_TAGS{"SpecialFunction"} },  @{$EXPORT_TAGS{$_}} );
}

$VERSION = '0.02';

sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.  If a constant is not found then control is passed
    # to the AUTOLOAD in AutoLoader.

    my $constname;
    ($constname = $AUTOLOAD) =~ s/.*:://;
    croak "& not defined" if $constname eq 'constant';
    my $val = constant($constname, @_ ? $_[0] : 0);
    if ($! != 0) {
	if ($! =~ /Invalid/) {
	    $AutoLoader::AUTOLOAD = $AUTOLOAD;
	    goto &AutoLoader::AUTOLOAD;
	}
	else {
		croak "Your vendor has not defined Gsl macro $constname";
	}
    }
    no strict 'refs';
    *$AUTOLOAD = sub () { $val };
    goto &$AUTOLOAD;
}

bootstrap Gsl $VERSION;

# Preloaded methods go here.
# Autoload methods go after =cut, and are processed by the autosplit program.

# aliases all of Gsl::SpecialFunctions to Gsl::, if they import them
for( @EXPORT_OK ) {
	*{"Gsl::$_"} = \&{"Gsl::SpecialFunction::$_"};
}


1;
__END__

=head1 NAME

Gsl - Perl Interface to The GNU Scientific Library

=head1 SYNOPSIS

  use Gsl qw(:FUNCTIONFAMILY);
  # returns an object for Special function answers
  my $r	     = new Gsl::SpecialFunction;
  my $answer = FUNCTION( $x );
  # functions that take a result object have a _e appended
  # to their name
  my $status = FUNCTION_e( $x, $r );
  print "Value: " . $r->val . "\n";
  print "Error: " . $r->err . "\n";
  print "Status: $status\n";


=head1 DESCRIPTION

  Currently this module only implements the GSL Special function library.

  Current Function Families and their description:
                Airy - Airy Functions  
                Bessel - Bessel Functions 
                Clausen - Clausen Functions 
                Coulomb - Coulomb Wave Functions 
                Coupling - Coupling Coefficients 
                Dawson - Dawson Function 
                Debye - Debye Functions 
		Dilog - Dilogarithm   
                Elementary - Elementary Functions
                EllipticInt - Elliptic Integrals 
                EllipticJac - Elliptic Functions (Jacobi) 
                Error - Error Function
                Exp - Exponential Function 
                ExpInt - Exponential Integrals
                FermiDirac - Fermi-Dirac Function 
                Gamma  - Gamma Function (includes Factorial) 
                Gegenbauer - Gegenbauer Functions 
                HyperGeometric - Hypergeometric Functions 
                Laguerre - Laguerre Functions 
		Lambert  - Lambert Functions
                Legendre - Legendre Functions and Spherical Harmonics 
                Log - Logarithm and Related Functions 
                Power - Power Function (x^n) 
                Psi - Psi (Digamma) Function
                Synchrotron - Synchrotron Functions 
                Transport - Transport Functions 
                Trig - Trigonometric Functions    
                Zeta - Zeta Functions 
                SpecialFunction - The Full Monty



=head1 Exported constants

	None

=head1 Exported functions

	Please go to http://sources.redhat.com/gsl/ref/gsl-ref_toc.html for a complete
	list of the functions, there are a lot of them, and GSL already has very good
	documentation for them.

=head1 AUTHOR

Jonathan Leto, jonathan@leto.net

=head1 SEE ALSO

GNU Scientific Library http://sources.redhat.com/gsl

To get Gsl: http://www.leto.net/code/gsl/

=cut
