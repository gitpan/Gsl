#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <gsl/gsl_sf.h>
#include <gsl/gsl_sf_result.h>
#include <gsl/gsl_sf_airy.h>
#include <gsl/gsl_sf_bessel.h>
#include <gsl/gsl_sf_clausen.h>
#include <gsl/gsl_sf_coulomb.h>
#include <gsl/gsl_sf_coupling.h>
#include <gsl/gsl_sf_dawson.h>
#include <gsl/gsl_sf_debye.h>
#include <gsl/gsl_sf_dilog.h>
#include <gsl/gsl_sf_elementary.h>
#include <gsl/gsl_sf_ellint.h>
#include <gsl/gsl_sf_elljac.h>
#include <gsl/gsl_sf_erf.h>
#include <gsl/gsl_sf_exp.h>
#include <gsl/gsl_sf_expint.h>
#include <gsl/gsl_sf_fermi_dirac.h>
#include <gsl/gsl_sf_gamma.h>
#include <gsl/gsl_sf_gegenbauer.h>
#include <gsl/gsl_sf_hyperg.h>
#include <gsl/gsl_sf_laguerre.h>
#include <gsl/gsl_sf_legendre.h>
#include <gsl/gsl_sf_lambert.h>
#include <gsl/gsl_sf_log.h>
#include <gsl/gsl_sf_pow_int.h>
#include <gsl/gsl_sf_psi.h>
#include <gsl/gsl_sf_synchrotron.h>
#include <gsl/gsl_sf_transport.h>
#include <gsl/gsl_sf_trig.h>
#include <gsl/gsl_sf_zeta.h>


static int
not_here(char *s)
{
    croak("%s not implemented on this architecture", s);
    return -1;
}

static double
constant(char *name, int arg)
{
    errno = 0;
    switch (*name) {
    case 'A':
	break;
    case 'B':
	break;
    case 'C':
	break;
    case 'D':
	break;
    case 'E':
	break;
    case 'F':
	break;
    case 'G':
	if (strEQ(name, "GSL_SF_GAMMA_XMAX"))
#ifdef GSL_SF_GAMMA_XMAX
	    return GSL_SF_GAMMA_XMAX;
#else
	    goto not_there;
#endif
	break;
    case 'H':
	break;
    case 'I':
	break;
    case 'J':
	break;
    case 'K':
	break;
    case 'L':
	break;
    case 'M':
	break;
    case 'N':
	break;
    case 'O':
	break;
    case 'P':
	break;
    case 'Q':
	break;
    case 'R':
	break;
    case 'S':
	break;
    case 'T':
	break;
    case 'U':
	break;
    case 'V':
	break;
    case 'W':
	break;
    case 'X':
	break;
    case 'Y':
	break;
    case 'Z':
	break;
    case '_':
	if (strEQ(name, "__BEGIN_DECLS"))
#ifdef __BEGIN_DECLS
	    return __BEGIN_DECLS;
#else
	    goto not_there;
#endif
	if (strEQ(name, "__END_DECLS"))
#ifdef __END_DECLS
	    return __END_DECLS;
#else
	    goto not_there;
#endif
	break;
    }
    errno = EINVAL;
    return 0;

not_there:
    errno = ENOENT;
    return 0;
}
MODULE = Gsl		PACKAGE = gsl_sf_resultPtr

void
DESTROY(self)
        gsl_sf_result *self
    CODE:
        safefree( (char*)self );

double
val(result)
	gsl_sf_result *result
	CODE:
		RETVAL=result->val;
	OUTPUT:
		RETVAL

MODULE = Gsl            PACKAGE = Gsl  

double
constant(name,arg)
        char *          name
        int             arg



MODULE = Gsl		PACKAGE = Gsl::SpecialFunction	 PREFIX = gsl_sf_	
PROTOTYPES: ENABLE

gsl_sf_result *
new (CLASS)
  char *CLASS
        CODE:
                gsl_sf_result * result;
                RETVAL = (gsl_sf_result *)safemalloc( sizeof( gsl_sf_result ) );
        OUTPUT:
                RETVAL



double
constant(name,arg)
	char *		name
	int		arg


int
gsl_sf_airy_Ai_e(x, mode, result)
        const double    x
        gsl_mode_t      mode
        gsl_sf_result * result

double
gsl_sf_airy_Ai(x, mode)
        const double    x
        gsl_mode_t      mode

int
gsl_sf_airy_Bi_e(x, mode, result)
        const double    x
        gsl_mode_t      mode
        gsl_sf_result * result

double
gsl_sf_airy_Bi(x, mode)
        const double    x
        gsl_mode_t      mode

int
gsl_sf_airy_Ai_scaled_e(x, mode, result)
        const double    x
        gsl_mode_t      mode
        gsl_sf_result * result

double
gsl_sf_airy_Ai_scaled(x, mode)
        const double    x
        gsl_mode_t      mode

int
gsl_sf_airy_Bi_scaled_e(x, mode, result)
        const double    x
        gsl_mode_t      mode
        gsl_sf_result * result

double
gsl_sf_airy_Bi_scaled(x, mode)
        const double    x
        gsl_mode_t      mode

int
gsl_sf_airy_Ai_deriv_e(x, mode, result)
        const double    x
        gsl_mode_t      mode
        gsl_sf_result * result

double
gsl_sf_airy_Ai_deriv(x, mode)
        const double    x
        gsl_mode_t      mode

int
gsl_sf_airy_Bi_deriv_e(x, mode, result)
        const double    x
        gsl_mode_t      mode
        gsl_sf_result * result

double
gsl_sf_airy_Bi_deriv(x, mode)
        const double    x
        gsl_mode_t      mode

int
gsl_sf_airy_Ai_deriv_scaled_e(x, mode, result)
        const double    x
        gsl_mode_t      mode
        gsl_sf_result * result

double
gsl_sf_airy_Ai_deriv_scaled(x, mode)
        const double    x
        gsl_mode_t      mode

int
gsl_sf_airy_Bi_deriv_scaled_e(x, mode, result)
        const double    x
        gsl_mode_t      mode
        gsl_sf_result * result

double
gsl_sf_airy_Bi_deriv_scaled(x, mode)
        const double    x
        gsl_mode_t      mode

int
gsl_sf_airy_zero_Ai_e(s, result)
        unsigned int    s
        gsl_sf_result * result

double
gsl_sf_airy_zero_Ai(s)
        unsigned int    s

int
gsl_sf_airy_zero_Bi_e(s, result)
        unsigned int    s
        gsl_sf_result * result

double
gsl_sf_airy_zero_Bi(s)
        unsigned int    s

int
gsl_sf_airy_zero_Ai_deriv_e(s, result)
        unsigned int    s
        gsl_sf_result * result

double
gsl_sf_airy_zero_Ai_deriv(s)
        unsigned int    s

int
gsl_sf_airy_zero_Bi_deriv_e(s, result)
        unsigned int    s
        gsl_sf_result * result

double
gsl_sf_airy_zero_Bi_deriv(s)
        unsigned int    s


int
gsl_sf_bessel_I0_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_I0_scaled_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_I1_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_I1_scaled_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_In_array(nmin, nmax, x, result_array)
        int     nmin
        int     nmax
        double  x
        double *        result_array

int
gsl_sf_bessel_In_e(n, x, result)
        int     n
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_In_scaled_array(nmin, nmax, x, result_array)
        int     nmin
        int     nmax
        double  x
        double *        result_array

int
gsl_sf_bessel_In_scaled_e(n, x, result)
        int     n
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_Inu_e(nu, x, result)
        double  nu
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_Inu_scaled_e(nu, x, result)
        double  nu
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_J0_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_J1_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_Jn_array(nmin, nmax, x, result_array)
        int     nmin
        int     nmax
        double  x
        double *        result_array

int
gsl_sf_bessel_Jn_e(n, x, result)
        int     n
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_Jnu_e(nu, x, result)
        double  nu
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_K0_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_K0_scaled_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_K1_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_K1_scaled_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_Kn_array(nmin, nmax, x, result_array)
        int     nmin
        int     nmax
        double  x
        double *        result_array

int
gsl_sf_bessel_Kn_e(n, x, result)
        int     n
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_Kn_scaled_array(nmin, nmax, x, result_array)
        int     nmin
        int     nmax
        double  x
        double *        result_array

int
gsl_sf_bessel_Kn_scaled_e(n, x, result)
        int     n
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_Knu_e(nu, x, result)
        double  nu
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_Knu_scaled_e(nu, x, result)
        double  nu
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_Y0_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_Y1_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_Yn_array(nmin, nmax, x, result_array)
        int     nmin
        int     nmax
        double  x
        double *        result_array

int
gsl_sf_bessel_Yn_e(n, x, result)
        int     n
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_Ynu_e(nu, x, result)
        double  nu
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_i0_scaled_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_i1_scaled_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_i2_scaled_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_il_scaled_array(lmax, x, result_array)
        int     lmax
        double  x
        double *        result_array

int
gsl_sf_bessel_il_scaled_e(l, x, result)
        int     l
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_j0_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_j1_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_j2_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_jl_array(lmax, x, result_array)
        int     lmax
        double  x
        double *        result_array

int
gsl_sf_bessel_jl_e(l, x, result)
        int     l
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_k0_scaled_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_k1_scaled_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_k2_scaled_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_kl_scaled_array(lmax, x, result_array)
        int     lmax
        double  x
        double *        result_array

int
gsl_sf_bessel_kl_scaled_e(l, x, result)
        int     l
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_lnKnu_e(nu, x, result)
        double  nu
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_y0_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_y1_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_y2_e(x, result)
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_yl_array(lmax, x, result_array)
        int     lmax
        double  x
        double *        result_array

int
gsl_sf_bessel_yl_e(l, x, result)
        int     l
        double  x
        gsl_sf_result * result

int
gsl_sf_bessel_zero_J0_e(s, result)
        unsigned int    s
        gsl_sf_result * result

int
gsl_sf_bessel_zero_J1_e(s, result)
        unsigned int    s
        gsl_sf_result * result

int
gsl_sf_bessel_zero_Jnu_e(nu, s, result)
        double  nu
        unsigned int    s
        gsl_sf_result * result


int
gsl_sf_clausen_e(x, result)
	double	x
	gsl_sf_result *	result

double
gsl_sf_clausen(x)
	const double	x


int
gsl_sf_result_smash_e(re, r)
	const gsl_sf_result_e10 *	re
	gsl_sf_result *	r

int
gsl_sf_hydrogenicR_1_e(Z, r, result)
	const double	Z
	const double	r
	gsl_sf_result *	result

double
gsl_sf_hydrogenicR_1(Z, r)
	const double	Z
	const double	r

int
gsl_sf_hydrogenicR_e(n, l, Z, r, result)
	const int	n
	const int	l
	const double	Z
	const double	r
	gsl_sf_result *	result

double
gsl_sf_hydrogenicR(n, l, Z, r)
	const int	n
	const int	l
	const double	Z
	const double	r

int
gsl_sf_coulomb_wave_FG_e(eta, x, lam_F, k_lam_G, F, Fp, G, Gp, exp_F, exp_G)
	const double	eta
	const double	x
	const double	lam_F
	const int	k_lam_G
	gsl_sf_result *	F
	gsl_sf_result *	Fp
	gsl_sf_result *	G
	gsl_sf_result *	Gp
	double *	exp_F
	double *	exp_G

int
gsl_sf_coulomb_wave_F_array(lam_min, kmax, eta, x, fc_array, F_exponent)
	double	lam_min
	int	kmax
	double	eta
	double	x
	double *	fc_array
	double *	F_exponent

int
gsl_sf_coulomb_wave_FG_array(lam_min, kmax, eta, x, fc_array, gc_array, F_exponent, G_exponent)
	double	lam_min
	int	kmax
	double	eta
	double	x
	double *	fc_array
	double *	gc_array
	double *	F_exponent
	double *	G_exponent

int
gsl_sf_coulomb_wave_FGp_array(lam_min, kmax, eta, x, fc_array, fcp_array, gc_array, gcp_array, F_exponent, G_exponent)
	double	lam_min
	int	kmax
	double	eta
	double	x
	double *	fc_array
	double *	fcp_array
	double *	gc_array
	double *	gcp_array
	double *	F_exponent
	double *	G_exponent

int
gsl_sf_coulomb_wave_sphF_array(lam_min, kmax, eta, x, fc_array, F_exponent)
	double	lam_min
	int	kmax
	double	eta
	double	x
	double *	fc_array
	double *	F_exponent

int
gsl_sf_coulomb_CL_e(L, eta, result)
	double	L
	double	eta
	gsl_sf_result *	result

int
gsl_sf_coulomb_CL_list(Lmin, kmax, eta, cl)
	double	Lmin
	int	kmax
	double	eta
	double *	cl

int
gsl_sf_coupling_3j_e(two_ja, two_jb, two_jc, two_ma, two_mb, two_mc, result)
	int	two_ja
	int	two_jb
	int	two_jc
	int	two_ma
	int	two_mb
	int	two_mc
	gsl_sf_result *	result

double
gsl_sf_coupling_3j(two_ja, two_jb, two_jc, two_ma, two_mb, two_mc)
	int	two_ja
	int	two_jb
	int	two_jc
	int	two_ma
	int	two_mb
	int	two_mc

int
gsl_sf_coupling_6j_e(two_ja, two_jb, two_jc, two_jd, two_je, two_jf, result)
	int	two_ja
	int	two_jb
	int	two_jc
	int	two_jd
	int	two_je
	int	two_jf
	gsl_sf_result *	result

double
gsl_sf_coupling_6j(two_ja, two_jb, two_jc, two_jd, two_je, two_jf)
	int	two_ja
	int	two_jb
	int	two_jc
	int	two_jd
	int	two_je
	int	two_jf

int
gsl_sf_coupling_9j_e(two_ja, two_jb, two_jc, two_jd, two_je, two_jf, two_jg, two_jh, two_ji, result)
	int	two_ja
	int	two_jb
	int	two_jc
	int	two_jd
	int	two_je
	int	two_jf
	int	two_jg
	int	two_jh
	int	two_ji
	gsl_sf_result *	result

double
gsl_sf_coupling_9j(two_ja, two_jb, two_jc, two_jd, two_je, two_jf, two_jg, two_jh, two_ji)
	int	two_ja
	int	two_jb
	int	two_jc
	int	two_jd
	int	two_je
	int	two_jf
	int	two_jg
	int	two_jh
	int	two_ji

int
gsl_sf_dawson_e(x, result)
	double	x
	gsl_sf_result *	result

double
gsl_sf_dawson(x)
	double	x


int
gsl_sf_debye_1_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_debye_1(x)
	const double	x

int
gsl_sf_debye_2_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_debye_2(x)
	const double	x

int
gsl_sf_debye_3_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_debye_3(x)
	const double	x

int
gsl_sf_debye_4_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_debye_4(x)
	const double	x


int
gsl_sf_dilog_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_dilog(x)
	const double	x

int
gsl_sf_complex_dilog_e(r, theta, result_re, result_im)
	const double	r
	double	theta
	gsl_sf_result *	result_re
	gsl_sf_result *	result_im


int
gsl_sf_multiply_e(x, y, result)
	const double	x
	const double	y
	gsl_sf_result *	result

double
gsl_sf_multiply(x, y)
	const double	x
	const double	y

int
gsl_sf_multiply_err_e(x, dx, y, dy, result)
	const double	x
	const double	dx
	const double	y
	const double	dy
	gsl_sf_result *	result


int
gsl_sf_ellint_Kcomp_e(k, mode, result)
	double	k
	gsl_mode_t	mode
	gsl_sf_result *	result

double
gsl_sf_ellint_Kcomp(k, mode)
	double	k
	gsl_mode_t	mode

int
gsl_sf_ellint_Ecomp_e(k, mode, result)
	double	k
	gsl_mode_t	mode
	gsl_sf_result *	result

double
gsl_sf_ellint_Ecomp(k, mode)
	double	k
	gsl_mode_t	mode

int
gsl_sf_ellint_F_e(phi, k, mode, result)
	double	phi
	double	k
	gsl_mode_t	mode
	gsl_sf_result *	result

double
gsl_sf_ellint_F(phi, k, mode)
	double	phi
	double	k
	gsl_mode_t	mode

int
gsl_sf_ellint_E_e(phi, k, mode, result)
	double	phi
	double	k
	gsl_mode_t	mode
	gsl_sf_result *	result

double
gsl_sf_ellint_E(phi, k, mode)
	double	phi
	double	k
	gsl_mode_t	mode

int
gsl_sf_ellint_P_e(phi, k, n, mode, result)
	double	phi
	double	k
	double	n
	gsl_mode_t	mode
	gsl_sf_result *	result

double
gsl_sf_ellint_P(phi, k, n, mode)
	double	phi
	double	k
	double	n
	gsl_mode_t	mode

int
gsl_sf_ellint_D_e(phi, k, n, mode, result)
	double	phi
	double	k
	double	n
	gsl_mode_t	mode
	gsl_sf_result *	result

double
gsl_sf_ellint_D(phi, k, n, mode)
	double	phi
	double	k
	double	n
	gsl_mode_t	mode

int
gsl_sf_ellint_RC_e(x, y, mode, result)
	double	x
	double	y
	gsl_mode_t	mode
	gsl_sf_result *	result

double
gsl_sf_ellint_RC(x, y, mode)
	double	x
	double	y
	gsl_mode_t	mode

int
gsl_sf_ellint_RD_e(x, y, z, mode, result)
	double	x
	double	y
	double	z
	gsl_mode_t	mode
	gsl_sf_result *	result

double
gsl_sf_ellint_RD(x, y, z, mode)
	double	x
	double	y
	double	z
	gsl_mode_t	mode

int
gsl_sf_ellint_RF_e(x, y, z, mode, result)
	double	x
	double	y
	double	z
	gsl_mode_t	mode
	gsl_sf_result *	result

double
gsl_sf_ellint_RF(x, y, z, mode)
	double	x
	double	y
	double	z
	gsl_mode_t	mode

int
gsl_sf_ellint_RJ_e(x, y, z, p, mode, result)
	double	x
	double	y
	double	z
	double	p
	gsl_mode_t	mode
	gsl_sf_result *	result

double
gsl_sf_ellint_RJ(x, y, z, p, mode)
	double	x
	double	y
	double	z
	double	p
	gsl_mode_t	mode


int
gsl_sf_elljac_e(u, m, sn, cn, dn)
	double	u
	double	m
	double *	sn
	double *	cn
	double *	dn


int
gsl_sf_erfc_e(x, result)
	double	x
	gsl_sf_result *	result

double
gsl_sf_erfc(x)
	double	x

int
gsl_sf_log_erfc_e(x, result)
	double	x
	gsl_sf_result *	result

double
gsl_sf_log_erfc(x)
	double	x

int
gsl_sf_erf_e(x, result)
	double	x
	gsl_sf_result *	result

double
gsl_sf_erf(x)
	double	x

int
gsl_sf_erf_Z_e(x, result)
	double	x
	gsl_sf_result *	result

int
gsl_sf_erf_Q_e(x, result)
	double	x
	gsl_sf_result *	result

double
gsl_sf_erf_Z(x)
	double	x

double
gsl_sf_erf_Q(x)
	double	x

int
gsl_sf_exp_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_exp(x)
	const double	x

int
gsl_sf_exp_e10_e(x, result)
	const double	x
	gsl_sf_result_e10 *	result

int
gsl_sf_exp_mult_e(x, y, result)
	const double	x
	const double	y
	gsl_sf_result *	result

double
gsl_sf_exp_mult(x, y)
	const double	x
	const double	y

int
gsl_sf_exp_mult_e10_e(x, y, result)
	const double	x
	const double	y
	gsl_sf_result_e10 *	result

int
gsl_sf_expm1_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_expm1(x)
	const double	x

int
gsl_sf_exprel_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_exprel(x)
	const double	x

int
gsl_sf_exprel_2_e(x, result)
	double	x
	gsl_sf_result *	result

double
gsl_sf_exprel_2(x)
	const double	x

int
gsl_sf_exprel_n_e(n, x, result)
	const int	n
	const double	x
	gsl_sf_result *	result

double
gsl_sf_exprel_n(n, x)
	const int	n
	const double	x

int
gsl_sf_exp_err_e(x, dx, result)
	const double	x
	const double	dx
	gsl_sf_result *	result

int
gsl_sf_exp_err_e10_e(x, dx, result)
	const double	x
	const double	dx
	gsl_sf_result_e10 *	result

int
gsl_sf_exp_mult_err_e(x, dx, y, dy, result)
	const double	x
	const double	dx
	const double	y
	const double	dy
	gsl_sf_result *	result

int
gsl_sf_exp_mult_err_e10_e(x, dx, y, dy, result)
	const double	x
	const double	dx
	const double	y
	const double	dy
	gsl_sf_result_e10 *	result

int
gsl_sf_expint_E1_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_expint_E1(x)
	const double	x

int
gsl_sf_expint_E2_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_expint_E2(x)
	const double	x

int
gsl_sf_expint_Ei_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_expint_Ei(x)
	const double	x

int
gsl_sf_Shi_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_Shi(x)
	const double	x

int
gsl_sf_Chi_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_Chi(x)
	const double	x

int
gsl_sf_expint_3_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_expint_3(x)
	double	x

int
gsl_sf_Si_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_Si(x)
	const double	x

int
gsl_sf_Ci_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_Ci(x)
	const double	x

int
gsl_sf_atanint_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_atanint(x)
	const double	x

int
gsl_sf_fermi_dirac_m1_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_fermi_dirac_m1(x)
	const double	x

int
gsl_sf_fermi_dirac_0_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_fermi_dirac_0(x)
	const double	x

int
gsl_sf_fermi_dirac_1_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_fermi_dirac_1(x)
	const double	x

int
gsl_sf_fermi_dirac_2_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_fermi_dirac_2(x)
	const double	x

int
gsl_sf_fermi_dirac_int_e(j, x, result)
	const int	j
	const double	x
	gsl_sf_result *	result

double
gsl_sf_fermi_dirac_int(j, x)
	const int	j
	const double	x

int
gsl_sf_fermi_dirac_mhalf_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_fermi_dirac_mhalf(x)
	const double	x

int
gsl_sf_fermi_dirac_half_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_fermi_dirac_half(x)
	const double	x

int
gsl_sf_fermi_dirac_3half_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_fermi_dirac_3half(x)
	const double	x

int
gsl_sf_fermi_dirac_inc_0_e(x, b, result)
	const double	x
	const double	b
	gsl_sf_result *	result

double
gsl_sf_fermi_dirac_inc_0(x, b)
	const double	x
	const double	b


int
gsl_sf_lngamma_e(x, result)
	double	x
	gsl_sf_result *	result

double
gsl_sf_lngamma(x)
	const double	x

int
gsl_sf_lngamma_sgn_e(x, result_lg, sgn)
	double	x
	gsl_sf_result *	result_lg
	double *	sgn

int
gsl_sf_gamma_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_gamma(x)
	const double	x

int
gsl_sf_gammastar_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_gammastar(x)
	const double	x

int
gsl_sf_gammainv_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_gammainv(x)
	const double	x

int
gsl_sf_lngamma_complex_e(zr, zi, lnr, arg)
	double	zr
	double	zi
	gsl_sf_result *	lnr
	gsl_sf_result *	arg

int
gsl_sf_taylorcoeff_e(n, x, result)
	const int	n
	const double	x
	gsl_sf_result *	result

double
gsl_sf_taylorcoeff(n, x)
	const int	n
	const double	x

int
gsl_sf_fact_e(n, result)
	const unsigned int	n
	gsl_sf_result *	result

double
gsl_sf_fact(n)
	const unsigned int	n

int
gsl_sf_doublefact_e(n, result)
	const unsigned int	n
	gsl_sf_result *	result

double
gsl_sf_doublefact(n)
	const unsigned int	n

int
gsl_sf_lnfact_e(n, result)
	const unsigned int	n
	gsl_sf_result *	result

double
gsl_sf_lnfact(n)
	const unsigned int	n

int
gsl_sf_lndoublefact_e(n, result)
	const unsigned int	n
	gsl_sf_result *	result

double
gsl_sf_lndoublefact(n)
	const unsigned int	n

int
gsl_sf_lnchoose_e(n, m, result)
	unsigned int	n
	unsigned int	m
	gsl_sf_result *	result

double
gsl_sf_lnchoose(n, m)
	unsigned int	n
	unsigned int	m

int
gsl_sf_choose_e(n, m, result)
	unsigned int	n
	unsigned int	m
	gsl_sf_result *	result

double
gsl_sf_choose(n, m)
	unsigned int	n
	unsigned int	m

int
gsl_sf_lnpoch_e(a, x, result)
	const double	a
	const double	x
	gsl_sf_result *	result

double
gsl_sf_lnpoch(a, x)
	const double	a
	const double	x

int
gsl_sf_lnpoch_sgn_e(a, x, result, sgn)
	const double	a
	const double	x
	gsl_sf_result *	result
	double *	sgn

int
gsl_sf_poch_e(a, x, result)
	const double	a
	const double	x
	gsl_sf_result *	result

double
gsl_sf_poch(a, x)
	const double	a
	const double	x

int
gsl_sf_pochrel_e(a, x, result)
	const double	a
	const double	x
	gsl_sf_result *	result

double
gsl_sf_pochrel(a, x)
	const double	a
	const double	x

int
gsl_sf_gamma_inc_Q_e(a, x, result)
	const double	a
	const double	x
	gsl_sf_result *	result

double
gsl_sf_gamma_inc_Q(a, x)
	const double	a
	const double	x

int
gsl_sf_gamma_inc_P_e(a, x, result)
	const double	a
	const double	x
	gsl_sf_result *	result

double
gsl_sf_gamma_inc_P(a, x)
	const double	a
	const double	x

int
gsl_sf_lnbeta_e(a, b, result)
	const double	a
	const double	b
	gsl_sf_result *	result

double
gsl_sf_lnbeta(a, b)
	const double	a
	const double	b

int
gsl_sf_beta_e(a, b, result)
	const double	a
	const double	b
	gsl_sf_result *	result

double
gsl_sf_beta(a, b)
	const double	a
	const double	b

int
gsl_sf_beta_inc_e(a, b, x, result)
	const double	a
	const double	b
	const double	x
	gsl_sf_result *	result

double
gsl_sf_beta_inc(a, b, x)
	const double	a
	const double	b
	const double	x

int
gsl_sf_gegenpoly_1_e(lambda, x, result)
	double	lambda
	double	x
	gsl_sf_result *	result

int
gsl_sf_gegenpoly_2_e(lambda, x, result)
	double	lambda
	double	x
	gsl_sf_result *	result

int
gsl_sf_gegenpoly_3_e(lambda, x, result)
	double	lambda
	double	x
	gsl_sf_result *	result

double
gsl_sf_gegenpoly_1(lambda, x)
	double	lambda
	double	x

double
gsl_sf_gegenpoly_2(lambda, x)
	double	lambda
	double	x

double
gsl_sf_gegenpoly_3(lambda, x)
	double	lambda
	double	x

int
gsl_sf_gegenpoly_n_e(n, lambda, x, result)
	int	n
	double	lambda
	double	x
	gsl_sf_result *	result

double
gsl_sf_gegenpoly_n(n, lambda, x)
	int	n
	double	lambda
	double	x

int
gsl_sf_gegenpoly_array(nmax, lambda, x, result_array)
	int	nmax
	double	lambda
	double	x
	double *	result_array

int
gsl_sf_hyperg_0F1_e(c, x, result)
	double	c
	double	x
	gsl_sf_result *	result

double
gsl_sf_hyperg_0F1(c, x)
	const double	c
	const double	x

int
gsl_sf_hyperg_1F1_int_e(m, n, x, result)
	const int	m
	const int	n
	const double	x
	gsl_sf_result *	result

double
gsl_sf_hyperg_1F1_int(m, n, x)
	const int	m
	const int	n
	double	x

int
gsl_sf_hyperg_1F1_e(a, b, x, result)
	const double	a
	const double	b
	const double	x
	gsl_sf_result *	result

double
gsl_sf_hyperg_1F1(a, b, x)
	double	a
	double	b
	double	x

int
gsl_sf_hyperg_U_int_e(m, n, x, result)
	const int	m
	const int	n
	const double	x
	gsl_sf_result *	result

double
gsl_sf_hyperg_U_int(m, n, x)
	const int	m
	const int	n
	const double	x

int
gsl_sf_hyperg_U_int_e10_e(m, n, x, result)
	const int	m
	const int	n
	const double	x
	gsl_sf_result_e10 *	result

int
gsl_sf_hyperg_U_e(a, b, x, result)
	const double	a
	const double	b
	const double	x
	gsl_sf_result *	result

double
gsl_sf_hyperg_U(a, b, x)
	const double	a
	const double	b
	const double	x

int
gsl_sf_hyperg_U_e10_e(a, b, x, result)
	const double	a
	const double	b
	const double	x
	gsl_sf_result_e10 *	result

int
gsl_sf_hyperg_2F1_e(a, b, c, x, result)
	double	a
	double	b
	const double	c
	const double	x
	gsl_sf_result *	result

double
gsl_sf_hyperg_2F1(a, b, c, x)
	double	a
	double	b
	double	c
	double	x

int
gsl_sf_hyperg_2F1_conj_e(aR, aI, c, x, result)
	const double	aR
	const double	aI
	const double	c
	const double	x
	gsl_sf_result *	result

double
gsl_sf_hyperg_2F1_conj(aR, aI, c, x)
	double	aR
	double	aI
	double	c
	double	x

int
gsl_sf_hyperg_2F1_renorm_e(a, b, c, x, result)
	const double	a
	const double	b
	const double	c
	const double	x
	gsl_sf_result *	result

double
gsl_sf_hyperg_2F1_renorm(a, b, c, x)
	double	a
	double	b
	double	c
	double	x

int
gsl_sf_hyperg_2F1_conj_renorm_e(aR, aI, c, x, result)
	const double	aR
	const double	aI
	const double	c
	const double	x
	gsl_sf_result *	result

double
gsl_sf_hyperg_2F1_conj_renorm(aR, aI, c, x)
	double	aR
	double	aI
	double	c
	double	x

int
gsl_sf_hyperg_2F0_e(a, b, x, result)
	const double	a
	const double	b
	const double	x
	gsl_sf_result *	result

double
gsl_sf_hyperg_2F0(a, b, x)
	const double	a
	const double	b
	const double	x

int
gsl_sf_laguerre_1_e(a, x, result)
	const double	a
	const double	x
	gsl_sf_result *	result

int
gsl_sf_laguerre_2_e(a, x, result)
	const double	a
	const double	x
	gsl_sf_result *	result

int
gsl_sf_laguerre_3_e(a, x, result)
	const double	a
	const double	x
	gsl_sf_result *	result

double
gsl_sf_laguerre_1(a, x)
	double	a
	double	x

double
gsl_sf_laguerre_2(a, x)
	double	a
	double	x

double
gsl_sf_laguerre_3(a, x)
	double	a
	double	x

int
gsl_sf_laguerre_n_e(n, a, x, result)
	const int	n
	const double	a
	const double	x
	gsl_sf_result *	result

double
gsl_sf_laguerre_n(n, a, x)
	int	n
	double	a
	double	x


double
gsl_sf_lambert_W0(x)
        double  x

int
gsl_sf_lambert_W0_e(x, result)
        double  x
        gsl_sf_result * result

double
gsl_sf_lambert_Wm1(x)
        double  x

int
gsl_sf_lambert_Wm1_e(x, result)
        double  x
        gsl_sf_result * result


int
gsl_sf_legendre_Pl_e(l, x, result)
	const int	l
	const double	x
	gsl_sf_result *	result

double
gsl_sf_legendre_Pl(l, x)
	const int	l
	const double	x

int
gsl_sf_legendre_Pl_array(lmax, x, result_array)
	const int	lmax
	const double	x
	double *	result_array

int
gsl_sf_legendre_P1_e(x, result)
	double	x
	gsl_sf_result *	result

int
gsl_sf_legendre_P2_e(x, result)
	double	x
	gsl_sf_result *	result

int
gsl_sf_legendre_P3_e(x, result)
	double	x
	gsl_sf_result *	result

double
gsl_sf_legendre_P1(x)
	const double	x

double
gsl_sf_legendre_P2(x)
	const double	x

double
gsl_sf_legendre_P3(x)
	const double	x

int
gsl_sf_legendre_Q0_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_legendre_Q0(x)
	const double	x

int
gsl_sf_legendre_Q1_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_legendre_Q1(x)
	const double	x

int
gsl_sf_legendre_Ql_e(l, x, result)
	const int	l
	const double	x
	gsl_sf_result *	result

double
gsl_sf_legendre_Ql(l, x)
	const int	l
	const double	x

int
gsl_sf_legendre_Plm_e(l, m, x, result)
	const int	l
	const int	m
	const double	x
	gsl_sf_result *	result

double
gsl_sf_legendre_Plm(l, m, x)
	const int	l
	const int	m
	const double	x

int
gsl_sf_legendre_Plm_array(lmax, m, x, result_array)
	const int	lmax
	const int	m
	const double	x
	double *	result_array

int
gsl_sf_legendre_sphPlm_e(l, m, x, result)
	const int	l
	int	m
	const double	x
	gsl_sf_result *	result

double
gsl_sf_legendre_sphPlm(l, m, x)
	const int	l
	const int	m
	const double	x

int
gsl_sf_legendre_sphPlm_array(lmax, m, x, result_array)
	const int	lmax
	int	m
	const double	x
	double *	result_array

 # int
 #gsl_sf_legendre_array_size(lmax, m)
 #	const int	lmax
 #	const int	m

int
gsl_sf_conicalP_half_e(lambda, x, result)
	const double	lambda
	const double	x
	gsl_sf_result *	result

double
gsl_sf_conicalP_half(lambda, x)
	const double	lambda
	const double	x

int
gsl_sf_conicalP_mhalf_e(lambda, x, result)
	const double	lambda
	const double	x
	gsl_sf_result *	result

double
gsl_sf_conicalP_mhalf(lambda, x)
	const double	lambda
	const double	x

int
gsl_sf_conicalP_0_e(lambda, x, result)
	const double	lambda
	const double	x
	gsl_sf_result *	result

double
gsl_sf_conicalP_0(lambda, x)
	const double	lambda
	const double	x

int
gsl_sf_conicalP_1_e(lambda, x, result)
	const double	lambda
	const double	x
	gsl_sf_result *	result

double
gsl_sf_conicalP_1(lambda, x)
	const double	lambda
	const double	x

int
gsl_sf_conicalP_sph_reg_e(l, lambda, x, result)
	const int	l
	const double	lambda
	const double	x
	gsl_sf_result *	result

double
gsl_sf_conicalP_sph_reg(l, lambda, x)
	const int	l
	const double	lambda
	const double	x

int
gsl_sf_conicalP_cyl_reg_e(m, lambda, x, result)
	const int	m
	const double	lambda
	const double	x
	gsl_sf_result *	result

double
gsl_sf_conicalP_cyl_reg(m, lambda, x)
	const int	m
	const double	lambda
	const double	x

int
gsl_sf_legendre_H3d_0_e(lambda, eta, result)
	const double	lambda
	const double	eta
	gsl_sf_result *	result

double
gsl_sf_legendre_H3d_0(lambda, eta)
	const double	lambda
	const double	eta

int
gsl_sf_legendre_H3d_1_e(lambda, eta, result)
	const double	lambda
	const double	eta
	gsl_sf_result *	result

double
gsl_sf_legendre_H3d_1(lambda, eta)
	const double	lambda
	const double	eta

int
gsl_sf_legendre_H3d_e(l, lambda, eta, result)
	const int	l
	const double	lambda
	const double	eta
	gsl_sf_result *	result

double
gsl_sf_legendre_H3d(l, lambda, eta)
	const int	l
	const double	lambda
	const double	eta

int
gsl_sf_legendre_H3d_array(lmax, lambda, eta, result_array)
	const int	lmax
	const double	lambda
	const double	eta
	double *	result_array


int
gsl_sf_log_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_log(x)
	const double	x

int
gsl_sf_log_abs_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_log_abs(x)
	const double	x

int
gsl_sf_complex_log_e(zr, zi, lnr, theta)
	const double	zr
	const double	zi
	gsl_sf_result *	lnr
	gsl_sf_result *	theta

int
gsl_sf_log_1plusx_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_log_1plusx(x)
	const double	x

int
gsl_sf_log_1plusx_mx_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_log_1plusx_mx(x)
	const double	x

int
gsl_sf_pow_int_e(x, n, result)
	double	x
	int	n
	gsl_sf_result *	result

double
gsl_sf_pow_int(x, n)
	const double	x
	const int	n


int
gsl_sf_psi_int_e(n, result)
	const int	n
	gsl_sf_result *	result

double
gsl_sf_psi_int(n)
	const int	n

int
gsl_sf_psi_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_psi(x)
	const double	x

int
gsl_sf_psi_1piy_e(y, result)
	const double	y
	gsl_sf_result *	result

double
gsl_sf_psi_1piy(y)
	const double	y

int
gsl_sf_psi_1_int_e(n, result)
	const int	n
	gsl_sf_result *	result

double
gsl_sf_psi_1_int(n)
	const int	n

int
gsl_sf_psi_n_e(n, x, result)
	const int	n
	const double	x
	gsl_sf_result *	result

double
gsl_sf_psi_n(n, x)
	const int	n
	const double	x


int
gsl_sf_synchrotron_1_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_synchrotron_1(x)
	const double	x

int
gsl_sf_synchrotron_2_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_synchrotron_2(x)
	const double	x


int
gsl_sf_transport_2_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_transport_2(x)
	const double	x

int
gsl_sf_transport_3_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_transport_3(x)
	const double	x

int
gsl_sf_transport_4_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_transport_4(x)
	const double	x

int
gsl_sf_transport_5_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_transport_5(x)
	const double	x

int
gsl_sf_sin_e(x, result)
	double	x
	gsl_sf_result *	result

double
gsl_sf_sin(x)
	const double	x

int
gsl_sf_cos_e(x, result)
	double	x
	gsl_sf_result *	result

double
gsl_sf_cos(x)
	const double	x

int
gsl_sf_hypot_e(x, y, result)
	const double	x
	const double	y
	gsl_sf_result *	result

double
gsl_sf_hypot(x, y)
	const double	x
	const double	y

int
gsl_sf_complex_sin_e(zr, zi, szr, szi)
	const double	zr
	const double	zi
	gsl_sf_result *	szr
	gsl_sf_result *	szi

int
gsl_sf_complex_cos_e(zr, zi, czr, czi)
	const double	zr
	const double	zi
	gsl_sf_result *	czr
	gsl_sf_result *	czi

int
gsl_sf_complex_logsin_e(zr, zi, lszr, lszi)
	const double	zr
	const double	zi
	gsl_sf_result *	lszr
	gsl_sf_result *	lszi

int
gsl_sf_sinc_e(x, result)
	double	x
	gsl_sf_result *	result

double
gsl_sf_sinc(x)
	const double	x

int
gsl_sf_lnsinh_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_lnsinh(x)
	const double	x

int
gsl_sf_lncosh_e(x, result)
	const double	x
	gsl_sf_result *	result

double
gsl_sf_lncosh(x)
	const double	x

int
gsl_sf_polar_to_rect(r, theta, x, y)
	const double	r
	const double	theta
	gsl_sf_result *	x
	gsl_sf_result *	y

int
gsl_sf_rect_to_polar(x, y, r, theta)
	const double	x
	const double	y
	gsl_sf_result *	r
	gsl_sf_result *	theta

int
gsl_sf_sin_err_e(x, dx, result)
	const double	x
	const double	dx
	gsl_sf_result *	result

int
gsl_sf_cos_err_e(x, dx, result)
	const double	x
	const double	dx
	gsl_sf_result *	result

int
gsl_sf_angle_restrict_symm_e(theta)
	double *	theta

double
gsl_sf_angle_restrict_symm(theta)
	const double	theta

int
gsl_sf_angle_restrict_pos_e(theta)
	double *	theta

double
gsl_sf_angle_restrict_pos(theta)
	const double	theta

int
gsl_sf_angle_restrict_symm_err_e(theta, result)
	const double	theta
	gsl_sf_result *	result

int
gsl_sf_angle_restrict_pos_err_e(theta, result)
	const double	theta
	gsl_sf_result *	result


int
gsl_sf_zeta_int_e(n, result)
	const int	n
	gsl_sf_result *	result

double
gsl_sf_zeta_int(n)
	const int	n

int
gsl_sf_zeta_e(s, result)
	const double	s
	gsl_sf_result *	result

double
gsl_sf_zeta(s)
	const double	s

int
gsl_sf_hzeta_e(s, q, result)
	const double	s
	const double	q
	gsl_sf_result *	result

double
gsl_sf_hzeta(s, q)
	const double	s
	const double	q

int
gsl_sf_eta_int_e(n, result)
	int	n
	gsl_sf_result *	result

double
gsl_sf_eta_int(n)
	const int	n

int
gsl_sf_eta_e(s, result)
	const double	s
	gsl_sf_result *	result

double
gsl_sf_eta(s)
	const double	s
