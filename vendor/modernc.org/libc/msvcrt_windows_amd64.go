// Code generated for windows/amd64 by 'ccgo --cpp=/usr/bin/x86_64-w64-mingw32-gcc --goos=windows --package-name libc --prefix-external=X --prefix-field=F --prefix-static-internal=_ --prefix-static-none=_ --prefix-tagged-struct=T --prefix-tagged-union=T --prefix-typename=T --winapi=string.h --winapi=wchar.h -build-lines=  -eval-all-macros -hide __acrt_iob_func -hide __mingw_vfwprintf -hide __mingw_vfwscanf -hide __mingw_vsnwprintf -hide __mingw_vswscanf -hide _strdup -hide _stricmp -hide _strnicmp -hide _vsnwprintf -hide _wcsicmp -hide _wcsnicmp -hide _wgetenv -hide _wputenv -hide _wtoi -hide _wunlink -hide memchr -hide memcmp -hide memcpy -hide memmove -hide memset -hide strcasecmp -hide strcat -hide strchr -hide strcmp -hide strcpy -hide strcspn -hide strdup -hide strerror -hide strlen -hide strncmp -hide strncpy -hide strpbrk -hide strrchr -hide strspn -hide strstr -hide wcrtomb -hide wcschr -hide wcscmp -hide wcscpy -hide wcsicmp -hide wcslen -hide wcsncmp -hide wcsrtombs -import syscall -o msvcrt_windows_amd64.go libmsvcrt.c', DO NOT EDIT.

package libc

import (
	"reflect"
	"unsafe"


	"syscall"
)

var (
	_ reflect.Type
	_ unsafe.Pointer
)

const MINGW_HAS_DDK_H = 1
const MINGW_HAS_SECURE_API = 1
const UNALIGNED = 0
const USE___UUIDOF = 0
const WCHAR_MAX = 65535
const WCHAR_MIN = 0
const WIN32 = 1
const WIN64 = 1
const WINNT = 1
const _ALPHA = 259
const _ANONYMOUS_STRUCT = 0
const _ANONYMOUS_UNION = 0
const _ARGMAX = 100
const _BLANK = 64
const _CONTROL = 32
const _CRTIMP2 = "_CRTIMP"
const _CRTIMP_ALTERNATIVE = "_CRTIMP"
const _CRTIMP_NOIA64 = "_CRTIMP"
const _CRTIMP_PURE = "_CRTIMP"
const _CRT_INTERNAL_LOCAL_PRINTF_OPTIONS = 4
const _CRT_INTERNAL_LOCAL_SCANF_OPTIONS = 2
const _CRT_INTERNAL_PRINTF_LEGACY_MSVCRT_COMPATIBILITY = 8
const _CRT_INTERNAL_PRINTF_LEGACY_THREE_DIGIT_EXPONENTS = 16
const _CRT_INTERNAL_PRINTF_LEGACY_VSPRINTF_NULL_TERMINATION = 1
const _CRT_INTERNAL_PRINTF_LEGACY_WIDE_SPECIFIERS = 4
const _CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR = 2
const _CRT_INTERNAL_SCANF_LEGACY_MSVCRT_COMPATIBILITY = 4
const _CRT_INTERNAL_SCANF_LEGACY_WIDE_SPECIFIERS = 2
const _CRT_INTERNAL_SCANF_SECURECRT = 1
const _CRT_SECURE_CPP_NOTHROW = 0
const _DIGIT = 4
const _HEX = 128
const _INTEGRAL_MAX_BITS = 64
const _LEADBYTE = 32768
const _LOWER = 2
const _MCRTIMP = "_CRTIMP"
const _MRTIMP2 = "_CRTIMP"
const _M_AMD64 = 100
const _M_X64 = 100
const _NLSCMPERROR = 2147483647
const _PUNCT = 16
const _SECURECRT_FILL_BUFFER_PATTERN = 253
const _SPACE = 8
const _TRUNCATE = -1
const _UPPER = 1
const _WConst_return = 0
const _WIN32 = 1
const _WIN32_WINNT = 2560
const _WIN64 = 1
const __ATOMIC_ACQUIRE = 2
const __ATOMIC_ACQ_REL = 4
const __ATOMIC_CONSUME = 1
const __ATOMIC_HLE_ACQUIRE = 65536
const __ATOMIC_HLE_RELEASE = 131072
const __ATOMIC_RELAXED = 0
const __ATOMIC_RELEASE = 3
const __ATOMIC_SEQ_CST = 5
const __BIGGEST_ALIGNMENT__ = 16
const __BYTE_ORDER__ = 1234
const __C89_NAMELESS = 0
const __CCGO__ = 1
const __CHAR_BIT__ = 8
const __CRTDECL = "__cdecl"
const __DBL_DECIMAL_DIG__ = 17
const __DBL_DIG__ = 15
const __DBL_HAS_DENORM__ = 1
const __DBL_HAS_INFINITY__ = 1
const __DBL_HAS_QUIET_NAN__ = 1
const __DBL_IS_IEC_60559__ = 2
const __DBL_MANT_DIG__ = 53
const __DBL_MAX_10_EXP__ = 308
const __DBL_MAX_EXP__ = 1024
const __DBL_MIN_10_EXP__ = -307
const __DBL_MIN_EXP__ = -1021
const __DEC128_EPSILON__ = 0
const __DEC128_MANT_DIG__ = 34
const __DEC128_MAX_EXP__ = 6145
const __DEC128_MAX__ = 0
const __DEC128_MIN_EXP__ = -6142
const __DEC128_MIN__ = 0
const __DEC128_SUBNORMAL_MIN__ = 0
const __DEC32_EPSILON__ = 0
const __DEC32_MANT_DIG__ = 7
const __DEC32_MAX_EXP__ = 97
const __DEC32_MAX__ = 0
const __DEC32_MIN_EXP__ = -94
const __DEC32_MIN__ = 0
const __DEC32_SUBNORMAL_MIN__ = 0
const __DEC64_EPSILON__ = 0
const __DEC64_MANT_DIG__ = 16
const __DEC64_MAX_EXP__ = 385
const __DEC64_MAX__ = 0
const __DEC64_MIN_EXP__ = -382
const __DEC64_MIN__ = 0
const __DEC64_SUBNORMAL_MIN__ = 0
const __DECIMAL_BID_FORMAT__ = 1
const __DECIMAL_DIG__ = 17
const __DEC_EVAL_METHOD__ = 2
const __FINITE_MATH_ONLY__ = 0
const __FLOAT_WORD_ORDER__ = 1234
const __FLT128_DECIMAL_DIG__ = 36
const __FLT128_DENORM_MIN__ = 0
const __FLT128_DIG__ = 33
const __FLT128_EPSILON__ = 0
const __FLT128_HAS_DENORM__ = 1
const __FLT128_HAS_INFINITY__ = 1
const __FLT128_HAS_QUIET_NAN__ = 1
const __FLT128_IS_IEC_60559__ = 2
const __FLT128_MANT_DIG__ = 113
const __FLT128_MAX_10_EXP__ = 4932
const __FLT128_MAX_EXP__ = 16384
const __FLT128_MAX__ = 0
const __FLT128_MIN_10_EXP__ = -4931
const __FLT128_MIN_EXP__ = -16381
const __FLT128_MIN__ = 0
const __FLT128_NORM_MAX__ = 0
const __FLT32X_DECIMAL_DIG__ = 17
const __FLT32X_DENORM_MIN__ = 0
const __FLT32X_DIG__ = 15
const __FLT32X_EPSILON__ = 0
const __FLT32X_HAS_DENORM__ = 1
const __FLT32X_HAS_INFINITY__ = 1
const __FLT32X_HAS_QUIET_NAN__ = 1
const __FLT32X_IS_IEC_60559__ = 2
const __FLT32X_MANT_DIG__ = 53
const __FLT32X_MAX_10_EXP__ = 308
const __FLT32X_MAX_EXP__ = 1024
const __FLT32X_MAX__ = 0
const __FLT32X_MIN_10_EXP__ = -307
const __FLT32X_MIN_EXP__ = -1021
const __FLT32X_MIN__ = 0
const __FLT32X_NORM_MAX__ = 0
const __FLT32_DECIMAL_DIG__ = 9
const __FLT32_DENORM_MIN__ = 0
const __FLT32_DIG__ = 6
const __FLT32_EPSILON__ = 0
const __FLT32_HAS_DENORM__ = 1
const __FLT32_HAS_INFINITY__ = 1
const __FLT32_HAS_QUIET_NAN__ = 1
const __FLT32_IS_IEC_60559__ = 2
const __FLT32_MANT_DIG__ = 24
const __FLT32_MAX_10_EXP__ = 38
const __FLT32_MAX_EXP__ = 128
const __FLT32_MAX__ = 0
const __FLT32_MIN_10_EXP__ = -37
const __FLT32_MIN_EXP__ = -125
const __FLT32_MIN__ = 0
const __FLT32_NORM_MAX__ = 0
const __FLT64X_DECIMAL_DIG__ = 36
const __FLT64X_DENORM_MIN__ = 0
const __FLT64X_DIG__ = 33
const __FLT64X_EPSILON__ = 0
const __FLT64X_HAS_DENORM__ = 1
const __FLT64X_HAS_INFINITY__ = 1
const __FLT64X_HAS_QUIET_NAN__ = 1
const __FLT64X_IS_IEC_60559__ = 2
const __FLT64X_MANT_DIG__ = 113
const __FLT64X_MAX_10_EXP__ = 4932
const __FLT64X_MAX_EXP__ = 16384
const __FLT64X_MAX__ = 0
const __FLT64X_MIN_10_EXP__ = -4931
const __FLT64X_MIN_EXP__ = -16381
const __FLT64X_MIN__ = 0
const __FLT64X_NORM_MAX__ = 0
const __FLT64_DECIMAL_DIG__ = 17
const __FLT64_DENORM_MIN__ = 0
const __FLT64_DIG__ = 15
const __FLT64_EPSILON__ = 0
const __FLT64_HAS_DENORM__ = 1
const __FLT64_HAS_INFINITY__ = 1
const __FLT64_HAS_QUIET_NAN__ = 1
const __FLT64_IS_IEC_60559__ = 2
const __FLT64_MANT_DIG__ = 53
const __FLT64_MAX_10_EXP__ = 308
const __FLT64_MAX_EXP__ = 1024
const __FLT64_MAX__ = 0
const __FLT64_MIN_10_EXP__ = -307
const __FLT64_MIN_EXP__ = -1021
const __FLT64_MIN__ = 0
const __FLT64_NORM_MAX__ = 0
const __FLT_DECIMAL_DIG__ = 9
const __FLT_DENORM_MIN__ = 0
const __FLT_DIG__ = 6
const __FLT_EPSILON__ = 0
const __FLT_EVAL_METHOD_TS_18661_3__ = 2
const __FLT_EVAL_METHOD__ = 2
const __FLT_HAS_DENORM__ = 1
const __FLT_HAS_INFINITY__ = 1
const __FLT_HAS_QUIET_NAN__ = 1
const __FLT_IS_IEC_60559__ = 2
const __FLT_MANT_DIG__ = 24
const __FLT_MAX_10_EXP__ = 38
const __FLT_MAX_EXP__ = 128
const __FLT_MAX__ = 0
const __FLT_MIN_10_EXP__ = -37
const __FLT_MIN_EXP__ = -125
const __FLT_MIN__ = 0
const __FLT_NORM_MAX__ = 0
const __FLT_RADIX__ = 2
const __FUNCTION__ = 0
const __FXSR__ = 1
const __GCC_ASM_FLAG_OUTPUTS__ = 1
const __GCC_ATOMIC_BOOL_LOCK_FREE = 2
const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = 2
const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = 2
const __GCC_ATOMIC_CHAR_LOCK_FREE = 2
const __GCC_ATOMIC_INT_LOCK_FREE = 2
const __GCC_ATOMIC_LLONG_LOCK_FREE = 2
const __GCC_ATOMIC_LONG_LOCK_FREE = 2
const __GCC_ATOMIC_POINTER_LOCK_FREE = 2
const __GCC_ATOMIC_SHORT_LOCK_FREE = 2
const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = 1
const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = 2
const __GCC_CONSTRUCTIVE_SIZE = 64
const __GCC_DESTRUCTIVE_SIZE = 64
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = 1
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = 1
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = 1
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = 1
const __GCC_IEC_559 = 2
const __GCC_IEC_559_COMPLEX = 2
const __GNUC_EXECUTION_CHARSET_NAME = "UTF-8"
const __GNUC_MINOR__ = 0
const __GNUC_PATCHLEVEL__ = 0
const __GNUC_STDC_INLINE__ = 1
const __GNUC_WIDE_EXECUTION_CHARSET_NAME = "UTF-16LE"
const __GNUC__ = 12
const __GNU_EXTENSION = 0
const __GOT_SECURE_LIB__ = 200411
const __GXX_ABI_VERSION = 1017
const __GXX_MERGED_TYPEINFO_NAMES = 0
const __GXX_TYPEINFO_EQUALITY_INLINE = 0
const __HAVE_SPECULATION_SAFE_VALUE = 1
const __INT16_MAX__ = 32767
const __INT32_MAX__ = 2147483647
const __INT32_TYPE__ = 0
const __INT64_MAX__ = 9223372036854775807
const __INT8_MAX__ = 127
const __INTMAX_MAX__ = 9223372036854775807
const __INTMAX_WIDTH__ = 64
const __INTPTR_MAX__ = 9223372036854775807
const __INTPTR_WIDTH__ = 64
const __INT_FAST16_MAX__ = 32767
const __INT_FAST16_WIDTH__ = 16
const __INT_FAST32_MAX__ = 2147483647
const __INT_FAST32_TYPE__ = 0
const __INT_FAST32_WIDTH__ = 32
const __INT_FAST64_MAX__ = 9223372036854775807
const __INT_FAST64_WIDTH__ = 64
const __INT_FAST8_MAX__ = 127
const __INT_FAST8_WIDTH__ = 8
const __INT_LEAST16_MAX__ = 32767
const __INT_LEAST16_WIDTH__ = 16
const __INT_LEAST32_MAX__ = 2147483647
const __INT_LEAST32_TYPE__ = 0
const __INT_LEAST32_WIDTH__ = 32
const __INT_LEAST64_MAX__ = 9223372036854775807
const __INT_LEAST64_WIDTH__ = 64
const __INT_LEAST8_MAX__ = 127
const __INT_LEAST8_WIDTH__ = 8
const __INT_MAX__ = 2147483647
const __INT_WIDTH__ = 32
const __LDBL_DECIMAL_DIG__ = 17
const __LDBL_DENORM_MIN__ = 0
const __LDBL_DIG__ = 15
const __LDBL_EPSILON__ = 0
const __LDBL_HAS_DENORM__ = 1
const __LDBL_HAS_INFINITY__ = 1
const __LDBL_HAS_QUIET_NAN__ = 1
const __LDBL_IS_IEC_60559__ = 2
const __LDBL_MANT_DIG__ = 53
const __LDBL_MAX_10_EXP__ = 308
const __LDBL_MAX_EXP__ = 1024
const __LDBL_MAX__ = 0
const __LDBL_MIN_10_EXP__ = -307
const __LDBL_MIN_EXP__ = -1021
const __LDBL_MIN__ = 0
const __LDBL_NORM_MAX__ = 0
const __LONG32 = 0
const __LONG_DOUBLE_64__ = 1
const __LONG_LONG_MAX__ = 9223372036854775807
const __LONG_LONG_WIDTH__ = 64
const __LONG_MAX__ = 2147483647
const __LONG_WIDTH__ = 32
const __MINGW32_MAJOR_VERSION = 3
const __MINGW32_MINOR_VERSION = 11
const __MINGW32__ = 1
const __MINGW64_VERSION_BUGFIX = 0
const __MINGW64_VERSION_MAJOR = 10
const __MINGW64_VERSION_MINOR = 0
const __MINGW64_VERSION_RC = 0
const __MINGW64_VERSION_STATE = "alpha"
const __MINGW64__ = 1
const __MINGW_ATTRIB_DEPRECATED_MSVC2005 = 0
const __MINGW_ATTRIB_DEPRECATED_SEC_WARN = 0
const __MINGW_DEBUGBREAK_IMPL = 1
const __MINGW_FORTIFY_LEVEL = 0
const __MINGW_FORTIFY_VA_ARG = 0
const __MINGW_GCC_VERSION = 120000
const __MINGW_HAVE_ANSI_C99_PRINTF = 1
const __MINGW_HAVE_ANSI_C99_SCANF = 1
const __MINGW_HAVE_WIDE_C99_PRINTF = 1
const __MINGW_HAVE_WIDE_C99_SCANF = 1
const __MINGW_MSVC2005_DEPREC_STR = "This POSIX function is deprecated beginning in Visual C++ 2005, use _CRT_NONSTDC_NO_DEPRECATE to disable deprecation"
const __MINGW_SEC_WARN_STR = "This function or variable may be unsafe, use _CRT_SECURE_NO_WARNINGS to disable deprecation"
const __MINGW_USE_UNDERSCORE_PREFIX = 0
const __MSVCRT_VERSION__ = 1792
const __MSVCRT__ = 1
const __NO_INLINE__ = 1
const __ORDER_BIG_ENDIAN__ = 4321
const __ORDER_LITTLE_ENDIAN__ = 1234
const __ORDER_PDP_ENDIAN__ = 3412
const __PCTYPE_FUNC = 0
const __PIC__ = 1
const __PRAGMA_REDEFINE_EXTNAME = 1
const __PRETTY_FUNCTION__ = 0
const __PTRDIFF_MAX__ = 9223372036854775807
const __PTRDIFF_WIDTH__ = 64
const __SCHAR_MAX__ = 127
const __SCHAR_WIDTH__ = 8
const __SEG_FS = 1
const __SEG_GS = 1
const __SEH__ = 1
const __SHRT_MAX__ = 32767
const __SHRT_WIDTH__ = 16
const __SIG_ATOMIC_MAX__ = 2147483647
const __SIG_ATOMIC_MIN__ = -2147483648
const __SIG_ATOMIC_TYPE__ = 0
const __SIG_ATOMIC_WIDTH__ = 32
const __SIZEOF_DOUBLE__ = 8
const __SIZEOF_FLOAT128__ = 16
const __SIZEOF_FLOAT80__ = 16
const __SIZEOF_FLOAT__ = 4
const __SIZEOF_INT128__ = 16
const __SIZEOF_INT__ = 4
const __SIZEOF_LONG_DOUBLE__ = 8
const __SIZEOF_LONG_LONG__ = 8
const __SIZEOF_LONG__ = 4
const __SIZEOF_POINTER__ = 8
const __SIZEOF_PTRDIFF_T__ = 8
const __SIZEOF_SHORT__ = 2
const __SIZEOF_SIZE_T__ = 8
const __SIZEOF_WCHAR_T__ = 2
const __SIZEOF_WINT_T__ = 2
const __SIZE_MAX__ = 18446744073709551615
const __SIZE_WIDTH__ = 64
const __STDC_HOSTED__ = 1
const __STDC_SECURE_LIB__ = 200411
const __STDC_UTF_16__ = 1
const __STDC_UTF_32__ = 1
const __STDC_VERSION__ = 201710
const __STDC__ = 1
const __UINT16_MAX__ = 65535
const __UINT32_MAX__ = 4294967295
const __UINT64_MAX__ = 18446744073709551615
const __UINT8_MAX__ = 255
const __UINTMAX_MAX__ = 18446744073709551615
const __UINTPTR_MAX__ = 18446744073709551615
const __UINT_FAST16_MAX__ = 65535
const __UINT_FAST32_MAX__ = 4294967295
const __UINT_FAST64_MAX__ = 18446744073709551615
const __UINT_FAST8_MAX__ = 255
const __UINT_LEAST16_MAX__ = 65535
const __UINT_LEAST32_MAX__ = 4294967295
const __UINT_LEAST64_MAX__ = 18446744073709551615
const __UINT_LEAST8_MAX__ = 255
const __USE_MINGW_ANSI_STDIO = 1
const __USE_MINGW_STRTOX = 1
const __VERSION__ = "12-win32"
const __WCHAR_MAX__ = 65535
const __WCHAR_MIN__ = 0
const __WCHAR_WIDTH__ = 16
const __WIN32 = 1
const __WIN32__ = 1
const __WIN64 = 1
const __WIN64__ = 1
const __WINNT = 1
const __WINNT__ = 1
const __WINT_MAX__ = 65535
const __WINT_MIN__ = 0
const __WINT_WIDTH__ = 16
const __amd64 = 1
const __amd64__ = 1
const __code_model_medium__ = 1
const __int16 = 0
const __int32 = 0
const __int8 = 0
const __k8 = 1
const __k8__ = 1
const __mingw_bos_ovr = "__mingw_ovr"
const __pic__ = 1
const __stat64 = 0
const __x86_64 = 1
const __x86_64__ = 1
const _fstat = 0
const _fstati64 = 0
const _inline = 0
const _iob = 0
const _pctype = 0
const _pwctype = 0
const _stat = 0
const _stati64 = 0
const _wctype = 0
const _wfinddata_t = 0
const _wfinddatai64_t = 0
const _wfindfirst = 0
const _wfindfirsti64 = 0
const _wfindnext = 0
const _wfindnexti64 = 0
const _wstat = 0
const _wstati64 = 0
const fstat64 = 0
const stat64 = 0
const stderr = 0
const stdin = 0
const stdout = 0
const strcasecmp = 0
const strncasecmp = 0
const wcswcs = 0
const wpopen = 0

type T__builtin_va_list = uintptr

type T__predefined_size_t = uint64

type T__predefined_wchar_t = uint16

type T__predefined_ptrdiff_t = int64

type T__gnuc_va_list = uintptr

type Tva_list = uintptr

type Tsize_t = uint64

type Tssize_t = int64

type Trsize_t = uint64

type Tintptr_t = int64

type Tuintptr_t = uint64

type Tptrdiff_t = int64

type Twchar_t = uint16

type Twint_t = uint16

type Twctype_t = uint16

type Terrno_t = int32

type T__time32_t = int32

type T__time64_t = int64

type Ttime_t = int64

type Tthreadlocaleinfostruct = struct {
	Frefcount      int32
	Flc_codepage   uint32
	Flc_collate_cp uint32
	Flc_handle     [6]uint32
	Flc_id         [6]TLC_ID
	Flc_category   [6]struct {
		Flocale    uintptr
		Fwlocale   uintptr
		Frefcount  uintptr
		Fwrefcount uintptr
	}
	Flc_clike            int32
	Fmb_cur_max          int32
	Flconv_intl_refcount uintptr
	Flconv_num_refcount  uintptr
	Flconv_mon_refcount  uintptr
	Flconv               uintptr
	Fctype1_refcount     uintptr
	Fctype1              uintptr
	Fpctype              uintptr
	Fpclmap              uintptr
	Fpcumap              uintptr
	Flc_time_curr        uintptr
}

type Tpthreadlocinfo = uintptr

type Tpthreadmbcinfo = uintptr

type T_locale_tstruct = struct {
	Flocinfo Tpthreadlocinfo
	Fmbcinfo Tpthreadmbcinfo
}

type Tlocaleinfo_struct = T_locale_tstruct

type T_locale_t = uintptr

type TLC_ID = struct {
	FwLanguage uint16
	FwCountry  uint16
	FwCodePage uint16
}

type TtagLC_ID = TLC_ID

type TLPLC_ID = uintptr

type Tthreadlocinfo = struct {
	Frefcount      int32
	Flc_codepage   uint32
	Flc_collate_cp uint32
	Flc_handle     [6]uint32
	Flc_id         [6]TLC_ID
	Flc_category   [6]struct {
		Flocale    uintptr
		Fwlocale   uintptr
		Frefcount  uintptr
		Fwrefcount uintptr
	}
	Flc_clike            int32
	Fmb_cur_max          int32
	Flconv_intl_refcount uintptr
	Flconv_num_refcount  uintptr
	Flconv_mon_refcount  uintptr
	Flconv               uintptr
	Fctype1_refcount     uintptr
	Fctype1              uintptr
	Fpctype              uintptr
	Fpclmap              uintptr
	Fpcumap              uintptr
	Flc_time_curr        uintptr
}

type T_iobuf = struct {
	F_ptr      uintptr
	F_cnt      int32
	F_base     uintptr
	F_flag     int32
	F_file     int32
	F_charbuf  int32
	F_bufsiz   int32
	F_tmpfname uintptr
}

type TFILE = struct {
	F_ptr      uintptr
	F_cnt      int32
	F_base     uintptr
	F_flag     int32
	F_file     int32
	F_charbuf  int32
	F_bufsiz   int32
	F_tmpfname uintptr
}

var proc__iob_func = modcrt.NewProc(GoString(__ccgo_ts))

// __attribute__ ((__dllimport__)) FILE * __attribute__((__cdecl__)) __iob_func(void);
func X__iob_func(tls *TLS) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc__iob_func.Addr())
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

type T_fsize_t = uint32

type T_wfinddata32_t = struct {
	Fattrib      uint32
	Ftime_create T__time32_t
	Ftime_access T__time32_t
	Ftime_write  T__time32_t
	Fsize        T_fsize_t
	Fname        [260]Twchar_t
}

type T_wfinddata32i64_t = struct {
	Fattrib      uint32
	Ftime_create T__time32_t
	Ftime_access T__time32_t
	Ftime_write  T__time32_t
	Fsize        int64
	Fname        [260]Twchar_t
}

type T_wfinddata64i32_t = struct {
	Fattrib      uint32
	Ftime_create T__time64_t
	Ftime_access T__time64_t
	Ftime_write  T__time64_t
	Fsize        T_fsize_t
	Fname        [260]Twchar_t
}

type T_wfinddata64_t = struct {
	Fattrib      uint32
	Ftime_create T__time64_t
	Ftime_access T__time64_t
	Ftime_write  T__time64_t
	Fsize        int64
	Fname        [260]Twchar_t
}

var prociswalpha = modcrt.NewProc(GoString(__ccgo_ts + 11))

// int __attribute__((__cdecl__)) iswalpha(wint_t _C);
func Xiswalpha(tls *TLS, __C Twint_t) (r int32) {
	r0, _, err := syscall.SyscallN(prociswalpha.Addr(), uintptr(__C))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_iswalpha_l = modcrt.NewProc(GoString(__ccgo_ts + 20))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _iswalpha_l(wint_t _C,_locale_t _Locale);
func X_iswalpha_l(tls *TLS, __C Twint_t, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_iswalpha_l.Addr(), uintptr(__C), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var prociswupper = modcrt.NewProc(GoString(__ccgo_ts + 32))

// int __attribute__((__cdecl__)) iswupper(wint_t _C);
func Xiswupper(tls *TLS, __C Twint_t) (r int32) {
	r0, _, err := syscall.SyscallN(prociswupper.Addr(), uintptr(__C))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_iswupper_l = modcrt.NewProc(GoString(__ccgo_ts + 41))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _iswupper_l(wint_t _C,_locale_t _Locale);
func X_iswupper_l(tls *TLS, __C Twint_t, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_iswupper_l.Addr(), uintptr(__C), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var prociswlower = modcrt.NewProc(GoString(__ccgo_ts + 53))

// int __attribute__((__cdecl__)) iswlower(wint_t _C);
func Xiswlower(tls *TLS, __C Twint_t) (r int32) {
	r0, _, err := syscall.SyscallN(prociswlower.Addr(), uintptr(__C))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_iswlower_l = modcrt.NewProc(GoString(__ccgo_ts + 62))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _iswlower_l(wint_t _C,_locale_t _Locale);
func X_iswlower_l(tls *TLS, __C Twint_t, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_iswlower_l.Addr(), uintptr(__C), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var prociswdigit = modcrt.NewProc(GoString(__ccgo_ts + 74))

// int __attribute__((__cdecl__)) iswdigit(wint_t _C);
func Xiswdigit(tls *TLS, __C Twint_t) (r int32) {
	r0, _, err := syscall.SyscallN(prociswdigit.Addr(), uintptr(__C))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_iswdigit_l = modcrt.NewProc(GoString(__ccgo_ts + 83))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _iswdigit_l(wint_t _C,_locale_t _Locale);
func X_iswdigit_l(tls *TLS, __C Twint_t, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_iswdigit_l.Addr(), uintptr(__C), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var prociswxdigit = modcrt.NewProc(GoString(__ccgo_ts + 95))

// int __attribute__((__cdecl__)) iswxdigit(wint_t _C);
func Xiswxdigit(tls *TLS, __C Twint_t) (r int32) {
	r0, _, err := syscall.SyscallN(prociswxdigit.Addr(), uintptr(__C))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_iswxdigit_l = modcrt.NewProc(GoString(__ccgo_ts + 105))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _iswxdigit_l(wint_t _C,_locale_t _Locale);
func X_iswxdigit_l(tls *TLS, __C Twint_t, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_iswxdigit_l.Addr(), uintptr(__C), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var prociswspace = modcrt.NewProc(GoString(__ccgo_ts + 118))

// int __attribute__((__cdecl__)) iswspace(wint_t _C);
func Xiswspace(tls *TLS, __C Twint_t) (r int32) {
	r0, _, err := syscall.SyscallN(prociswspace.Addr(), uintptr(__C))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_iswspace_l = modcrt.NewProc(GoString(__ccgo_ts + 127))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _iswspace_l(wint_t _C,_locale_t _Locale);
func X_iswspace_l(tls *TLS, __C Twint_t, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_iswspace_l.Addr(), uintptr(__C), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var prociswpunct = modcrt.NewProc(GoString(__ccgo_ts + 139))

// int __attribute__((__cdecl__)) iswpunct(wint_t _C);
func Xiswpunct(tls *TLS, __C Twint_t) (r int32) {
	r0, _, err := syscall.SyscallN(prociswpunct.Addr(), uintptr(__C))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_iswpunct_l = modcrt.NewProc(GoString(__ccgo_ts + 148))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _iswpunct_l(wint_t _C,_locale_t _Locale);
func X_iswpunct_l(tls *TLS, __C Twint_t, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_iswpunct_l.Addr(), uintptr(__C), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var prociswalnum = modcrt.NewProc(GoString(__ccgo_ts + 160))

// int __attribute__((__cdecl__)) iswalnum(wint_t _C);
func Xiswalnum(tls *TLS, __C Twint_t) (r int32) {
	r0, _, err := syscall.SyscallN(prociswalnum.Addr(), uintptr(__C))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_iswalnum_l = modcrt.NewProc(GoString(__ccgo_ts + 169))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _iswalnum_l(wint_t _C,_locale_t _Locale);
func X_iswalnum_l(tls *TLS, __C Twint_t, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_iswalnum_l.Addr(), uintptr(__C), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var prociswprint = modcrt.NewProc(GoString(__ccgo_ts + 181))

// int __attribute__((__cdecl__)) iswprint(wint_t _C);
func Xiswprint(tls *TLS, __C Twint_t) (r int32) {
	r0, _, err := syscall.SyscallN(prociswprint.Addr(), uintptr(__C))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_iswprint_l = modcrt.NewProc(GoString(__ccgo_ts + 190))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _iswprint_l(wint_t _C,_locale_t _Locale);
func X_iswprint_l(tls *TLS, __C Twint_t, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_iswprint_l.Addr(), uintptr(__C), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var prociswgraph = modcrt.NewProc(GoString(__ccgo_ts + 202))

// int __attribute__((__cdecl__)) iswgraph(wint_t _C);
func Xiswgraph(tls *TLS, __C Twint_t) (r int32) {
	r0, _, err := syscall.SyscallN(prociswgraph.Addr(), uintptr(__C))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_iswgraph_l = modcrt.NewProc(GoString(__ccgo_ts + 211))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _iswgraph_l(wint_t _C,_locale_t _Locale);
func X_iswgraph_l(tls *TLS, __C Twint_t, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_iswgraph_l.Addr(), uintptr(__C), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var prociswcntrl = modcrt.NewProc(GoString(__ccgo_ts + 223))

// int __attribute__((__cdecl__)) iswcntrl(wint_t _C);
func Xiswcntrl(tls *TLS, __C Twint_t) (r int32) {
	r0, _, err := syscall.SyscallN(prociswcntrl.Addr(), uintptr(__C))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_iswcntrl_l = modcrt.NewProc(GoString(__ccgo_ts + 232))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _iswcntrl_l(wint_t _C,_locale_t _Locale);
func X_iswcntrl_l(tls *TLS, __C Twint_t, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_iswcntrl_l.Addr(), uintptr(__C), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var prociswascii = modcrt.NewProc(GoString(__ccgo_ts + 244))

// int __attribute__((__cdecl__)) iswascii(wint_t _C);
func Xiswascii(tls *TLS, __C Twint_t) (r int32) {
	r0, _, err := syscall.SyscallN(prociswascii.Addr(), uintptr(__C))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var procisleadbyte = modcrt.NewProc(GoString(__ccgo_ts + 253))

// int __attribute__((__cdecl__)) isleadbyte(int _C);
func Xisleadbyte(tls *TLS, __C int32) (r int32) {
	r0, _, err := syscall.SyscallN(procisleadbyte.Addr(), uintptr(__C))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_isleadbyte_l = modcrt.NewProc(GoString(__ccgo_ts + 264))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _isleadbyte_l(int _C,_locale_t _Locale);
func X_isleadbyte_l(tls *TLS, __C int32, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_isleadbyte_l.Addr(), uintptr(__C), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proctowupper = modcrt.NewProc(GoString(__ccgo_ts + 278))

// wint_t __attribute__((__cdecl__)) towupper(wint_t _C);
func Xtowupper(tls *TLS, __C Twint_t) (r Twint_t) {
	r0, _, err := syscall.SyscallN(proctowupper.Addr(), uintptr(__C))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Twint_t(r0)
}

var proc_towupper_l = modcrt.NewProc(GoString(__ccgo_ts + 287))

// __attribute__ ((__dllimport__)) wint_t __attribute__((__cdecl__)) _towupper_l(wint_t _C,_locale_t _Locale);
func X_towupper_l(tls *TLS, __C Twint_t, __Locale T_locale_t) (r Twint_t) {
	r0, _, err := syscall.SyscallN(proc_towupper_l.Addr(), uintptr(__C), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Twint_t(r0)
}

var proctowlower = modcrt.NewProc(GoString(__ccgo_ts + 299))

// wint_t __attribute__((__cdecl__)) towlower(wint_t _C);
func Xtowlower(tls *TLS, __C Twint_t) (r Twint_t) {
	r0, _, err := syscall.SyscallN(proctowlower.Addr(), uintptr(__C))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Twint_t(r0)
}

var proc_towlower_l = modcrt.NewProc(GoString(__ccgo_ts + 308))

// __attribute__ ((__dllimport__)) wint_t __attribute__((__cdecl__)) _towlower_l(wint_t _C,_locale_t _Locale);
func X_towlower_l(tls *TLS, __C Twint_t, __Locale T_locale_t) (r Twint_t) {
	r0, _, err := syscall.SyscallN(proc_towlower_l.Addr(), uintptr(__C), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Twint_t(r0)
}

var prociswctype = modcrt.NewProc(GoString(__ccgo_ts + 320))

// int __attribute__((__cdecl__)) iswctype(wint_t _C,wctype_t _Type);
func Xiswctype(tls *TLS, __C Twint_t, __Type Twctype_t) (r int32) {
	r0, _, err := syscall.SyscallN(prociswctype.Addr(), uintptr(__C), uintptr(__Type))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var procis_wctype = modcrt.NewProc(GoString(__ccgo_ts + 329))

// int __attribute__((__cdecl__)) is_wctype(wint_t _C,wctype_t _Type);
func Xis_wctype(tls *TLS, __C Twint_t, __Type Twctype_t) (r int32) {
	r0, _, err := syscall.SyscallN(procis_wctype.Addr(), uintptr(__C), uintptr(__Type))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var prociswblank = modcrt.NewProc(GoString(__ccgo_ts + 339))

// int __attribute__((__cdecl__)) iswblank(wint_t _C);
func Xiswblank(tls *TLS, __C Twint_t) (r int32) {
	r0, _, err := syscall.SyscallN(prociswblank.Addr(), uintptr(__C))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wgetcwd = modcrt.NewProc(GoString(__ccgo_ts + 348))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _wgetcwd(wchar_t *_DstBuf,int _SizeInWords);
func X_wgetcwd(tls *TLS, __DstBuf uintptr, __SizeInWords int32) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wgetcwd.Addr(), __DstBuf, uintptr(__SizeInWords))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wgetdcwd = modcrt.NewProc(GoString(__ccgo_ts + 357))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _wgetdcwd(int _Drive,wchar_t *_DstBuf,int _SizeInWords);
func X_wgetdcwd(tls *TLS, __Drive int32, __DstBuf uintptr, __SizeInWords int32) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wgetdcwd.Addr(), uintptr(__Drive), __DstBuf, uintptr(__SizeInWords))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wchdir = modcrt.NewProc(GoString(__ccgo_ts + 367))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wchdir(const wchar_t *_Path);
func X_wchdir(tls *TLS, __Path uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wchdir.Addr(), __Path)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wmkdir = modcrt.NewProc(GoString(__ccgo_ts + 375))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wmkdir(const wchar_t *_Path);
func X_wmkdir(tls *TLS, __Path uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wmkdir.Addr(), __Path)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wrmdir = modcrt.NewProc(GoString(__ccgo_ts + 383))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wrmdir(const wchar_t *_Path);
func X_wrmdir(tls *TLS, __Path uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wrmdir.Addr(), __Path)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_waccess = modcrt.NewProc(GoString(__ccgo_ts + 391))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _waccess(const wchar_t *_Filename,int _AccessMode);
func X_waccess(tls *TLS, __Filename uintptr, __AccessMode int32) (r int32) {
	r0, _, err := syscall.SyscallN(proc_waccess.Addr(), __Filename, uintptr(__AccessMode))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wchmod = modcrt.NewProc(GoString(__ccgo_ts + 400))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wchmod(const wchar_t *_Filename,int _Mode);
func X_wchmod(tls *TLS, __Filename uintptr, __Mode int32) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wchmod.Addr(), __Filename, uintptr(__Mode))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wcreat = modcrt.NewProc(GoString(__ccgo_ts + 408))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcreat(const wchar_t *_Filename,int _PermissionMode);
func X_wcreat(tls *TLS, __Filename uintptr, __PermissionMode int32) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wcreat.Addr(), __Filename, uintptr(__PermissionMode))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wfindfirst32 = modcrt.NewProc(GoString(__ccgo_ts + 416))

// __attribute__ ((__dllimport__)) intptr_t __attribute__((__cdecl__)) _wfindfirst32(const wchar_t *_Filename,struct _wfinddata32_t *_FindData);
func X_wfindfirst32(tls *TLS, __Filename uintptr, __FindData uintptr) (r Tintptr_t) {
	r0, _, err := syscall.SyscallN(proc_wfindfirst32.Addr(), __Filename, __FindData)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tintptr_t(r0)
}

var proc_wfindnext32 = modcrt.NewProc(GoString(__ccgo_ts + 430))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wfindnext32(intptr_t _FindHandle,struct _wfinddata32_t *_FindData);
func X_wfindnext32(tls *TLS, __FindHandle Tintptr_t, __FindData uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wfindnext32.Addr(), uintptr(__FindHandle), __FindData)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wrename = modcrt.NewProc(GoString(__ccgo_ts + 443))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wrename(const wchar_t *_OldFilename,const wchar_t *_NewFilename);
func X_wrename(tls *TLS, __OldFilename uintptr, __NewFilename uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wrename.Addr(), __OldFilename, __NewFilename)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wmktemp = modcrt.NewProc(GoString(__ccgo_ts + 452))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _wmktemp(wchar_t *_TemplateName);
func X_wmktemp(tls *TLS, __TemplateName uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wmktemp.Addr(), __TemplateName)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wfindfirst32i64 = modcrt.NewProc(GoString(__ccgo_ts + 461))

// __attribute__ ((__dllimport__)) intptr_t __attribute__((__cdecl__)) _wfindfirst32i64(const wchar_t *_Filename,struct _wfinddata32i64_t *_FindData);
func X_wfindfirst32i64(tls *TLS, __Filename uintptr, __FindData uintptr) (r Tintptr_t) {
	r0, _, err := syscall.SyscallN(proc_wfindfirst32i64.Addr(), __Filename, __FindData)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tintptr_t(r0)
}

var proc_wfindfirst64i32 = modcrt.NewProc(GoString(__ccgo_ts + 478))

// intptr_t __attribute__((__cdecl__)) _wfindfirst64i32(const wchar_t *_Filename,struct _wfinddata64i32_t *_FindData);
func X_wfindfirst64i32(tls *TLS, __Filename uintptr, __FindData uintptr) (r Tintptr_t) {
	r0, _, err := syscall.SyscallN(proc_wfindfirst64i32.Addr(), __Filename, __FindData)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tintptr_t(r0)
}

var proc_wfindfirst64 = modcrt.NewProc(GoString(__ccgo_ts + 495))

// __attribute__ ((__dllimport__)) intptr_t __attribute__((__cdecl__)) _wfindfirst64(const wchar_t *_Filename,struct _wfinddata64_t *_FindData);
func X_wfindfirst64(tls *TLS, __Filename uintptr, __FindData uintptr) (r Tintptr_t) {
	r0, _, err := syscall.SyscallN(proc_wfindfirst64.Addr(), __Filename, __FindData)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tintptr_t(r0)
}

var proc_wfindnext32i64 = modcrt.NewProc(GoString(__ccgo_ts + 509))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wfindnext32i64(intptr_t _FindHandle,struct _wfinddata32i64_t *_FindData);
func X_wfindnext32i64(tls *TLS, __FindHandle Tintptr_t, __FindData uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wfindnext32i64.Addr(), uintptr(__FindHandle), __FindData)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wfindnext64i32 = modcrt.NewProc(GoString(__ccgo_ts + 525))

// int __attribute__((__cdecl__)) _wfindnext64i32(intptr_t _FindHandle,struct _wfinddata64i32_t *_FindData);
func X_wfindnext64i32(tls *TLS, __FindHandle Tintptr_t, __FindData uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wfindnext64i32.Addr(), uintptr(__FindHandle), __FindData)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wfindnext64 = modcrt.NewProc(GoString(__ccgo_ts + 541))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wfindnext64(intptr_t _FindHandle,struct _wfinddata64_t *_FindData);
func X_wfindnext64(tls *TLS, __FindHandle Tintptr_t, __FindData uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wfindnext64.Addr(), uintptr(__FindHandle), __FindData)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wsopen_s = modcrt.NewProc(GoString(__ccgo_ts + 554))

// __attribute__ ((__dllimport__)) errno_t __attribute__((__cdecl__)) _wsopen_s(int *_FileHandle,const wchar_t *_Filename,int _OpenFlag,int _ShareFlag,int _PermissionFlag);
func X_wsopen_s(tls *TLS, __FileHandle uintptr, __Filename uintptr, __OpenFlag int32, __ShareFlag int32, __PermissionFlag int32) (r Terrno_t) {
	r0, _, err := syscall.SyscallN(proc_wsopen_s.Addr(), __FileHandle, __Filename, uintptr(__OpenFlag), uintptr(__ShareFlag), uintptr(__PermissionFlag))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Terrno_t(r0)
}

var proc_wsetlocale = modcrt.NewProc(GoString(__ccgo_ts + 564))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _wsetlocale(int _Category,const wchar_t *_Locale);
func X_wsetlocale(tls *TLS, __Category int32, __Locale uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wsetlocale.Addr(), uintptr(__Category), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wexecv = modcrt.NewProc(GoString(__ccgo_ts + 576))

// __attribute__ ((__dllimport__)) intptr_t __attribute__((__cdecl__)) _wexecv(const wchar_t *_Filename,const wchar_t *const *_ArgList);
func X_wexecv(tls *TLS, __Filename uintptr, __ArgList uintptr) (r Tintptr_t) {
	r0, _, err := syscall.SyscallN(proc_wexecv.Addr(), __Filename, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tintptr_t(r0)
}

var proc_wexecve = modcrt.NewProc(GoString(__ccgo_ts + 584))

// __attribute__ ((__dllimport__)) intptr_t __attribute__((__cdecl__)) _wexecve(const wchar_t *_Filename,const wchar_t *const *_ArgList,const wchar_t *const *_Env);
func X_wexecve(tls *TLS, __Filename uintptr, __ArgList uintptr, __Env uintptr) (r Tintptr_t) {
	r0, _, err := syscall.SyscallN(proc_wexecve.Addr(), __Filename, __ArgList, __Env)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tintptr_t(r0)
}

var proc_wexecvp = modcrt.NewProc(GoString(__ccgo_ts + 593))

// __attribute__ ((__dllimport__)) intptr_t __attribute__((__cdecl__)) _wexecvp(const wchar_t *_Filename,const wchar_t *const *_ArgList);
func X_wexecvp(tls *TLS, __Filename uintptr, __ArgList uintptr) (r Tintptr_t) {
	r0, _, err := syscall.SyscallN(proc_wexecvp.Addr(), __Filename, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tintptr_t(r0)
}

var proc_wexecvpe = modcrt.NewProc(GoString(__ccgo_ts + 602))

// __attribute__ ((__dllimport__)) intptr_t __attribute__((__cdecl__)) _wexecvpe(const wchar_t *_Filename,const wchar_t *const *_ArgList,const wchar_t *const *_Env);
func X_wexecvpe(tls *TLS, __Filename uintptr, __ArgList uintptr, __Env uintptr) (r Tintptr_t) {
	r0, _, err := syscall.SyscallN(proc_wexecvpe.Addr(), __Filename, __ArgList, __Env)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tintptr_t(r0)
}

var proc_wspawnv = modcrt.NewProc(GoString(__ccgo_ts + 612))

// __attribute__ ((__dllimport__)) intptr_t __attribute__((__cdecl__)) _wspawnv(int _Mode,const wchar_t *_Filename,const wchar_t *const *_ArgList);
func X_wspawnv(tls *TLS, __Mode int32, __Filename uintptr, __ArgList uintptr) (r Tintptr_t) {
	r0, _, err := syscall.SyscallN(proc_wspawnv.Addr(), uintptr(__Mode), __Filename, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tintptr_t(r0)
}

var proc_wspawnve = modcrt.NewProc(GoString(__ccgo_ts + 621))

// __attribute__ ((__dllimport__)) intptr_t __attribute__((__cdecl__)) _wspawnve(int _Mode,const wchar_t *_Filename,const wchar_t *const *_ArgList,const wchar_t *const *_Env);
func X_wspawnve(tls *TLS, __Mode int32, __Filename uintptr, __ArgList uintptr, __Env uintptr) (r Tintptr_t) {
	r0, _, err := syscall.SyscallN(proc_wspawnve.Addr(), uintptr(__Mode), __Filename, __ArgList, __Env)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tintptr_t(r0)
}

var proc_wspawnvp = modcrt.NewProc(GoString(__ccgo_ts + 631))

// __attribute__ ((__dllimport__)) intptr_t __attribute__((__cdecl__)) _wspawnvp(int _Mode,const wchar_t *_Filename,const wchar_t *const *_ArgList);
func X_wspawnvp(tls *TLS, __Mode int32, __Filename uintptr, __ArgList uintptr) (r Tintptr_t) {
	r0, _, err := syscall.SyscallN(proc_wspawnvp.Addr(), uintptr(__Mode), __Filename, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tintptr_t(r0)
}

var proc_wspawnvpe = modcrt.NewProc(GoString(__ccgo_ts + 641))

// __attribute__ ((__dllimport__)) intptr_t __attribute__((__cdecl__)) _wspawnvpe(int _Mode,const wchar_t *_Filename,const wchar_t *const *_ArgList,const wchar_t *const *_Env);
func X_wspawnvpe(tls *TLS, __Mode int32, __Filename uintptr, __ArgList uintptr, __Env uintptr) (r Tintptr_t) {
	r0, _, err := syscall.SyscallN(proc_wspawnvpe.Addr(), uintptr(__Mode), __Filename, __ArgList, __Env)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tintptr_t(r0)
}

var proc_wsystem = modcrt.NewProc(GoString(__ccgo_ts + 652))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wsystem(const wchar_t *_Command);
func X_wsystem(tls *TLS, __Command uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wsystem.Addr(), __Command)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

type T_ino_t = uint16

type Tino_t = uint16

type T_dev_t = uint32

type Tdev_t = uint32

type T_off_t = int32

type Toff32_t = int32

type T_off64_t = int64

type Toff64_t = int64

type Toff_t = int32

type T_stat32 = struct {
	Fst_dev   T_dev_t
	Fst_ino   T_ino_t
	Fst_mode  uint16
	Fst_nlink int16
	Fst_uid   int16
	Fst_gid   int16
	Fst_rdev  T_dev_t
	Fst_size  T_off_t
	Fst_atime T__time32_t
	Fst_mtime T__time32_t
	Fst_ctime T__time32_t
}

type Tstat = struct {
	Fst_dev   T_dev_t
	Fst_ino   T_ino_t
	Fst_mode  uint16
	Fst_nlink int16
	Fst_uid   int16
	Fst_gid   int16
	Fst_rdev  T_dev_t
	Fst_size  T_off_t
	Fst_atime Ttime_t
	Fst_mtime Ttime_t
	Fst_ctime Ttime_t
}

type T_stat32i64 = struct {
	Fst_dev   T_dev_t
	Fst_ino   T_ino_t
	Fst_mode  uint16
	Fst_nlink int16
	Fst_uid   int16
	Fst_gid   int16
	Fst_rdev  T_dev_t
	Fst_size  int64
	Fst_atime T__time32_t
	Fst_mtime T__time32_t
	Fst_ctime T__time32_t
}

type T_stat64i32 = struct {
	Fst_dev   T_dev_t
	Fst_ino   T_ino_t
	Fst_mode  uint16
	Fst_nlink int16
	Fst_uid   int16
	Fst_gid   int16
	Fst_rdev  T_dev_t
	Fst_size  T_off_t
	Fst_atime T__time64_t
	Fst_mtime T__time64_t
	Fst_ctime T__time64_t
}

type T_stat64 = struct {
	Fst_dev   T_dev_t
	Fst_ino   T_ino_t
	Fst_mode  uint16
	Fst_nlink int16
	Fst_uid   int16
	Fst_gid   int16
	Fst_rdev  T_dev_t
	Fst_size  int64
	Fst_atime T__time64_t
	Fst_mtime T__time64_t
	Fst_ctime T__time64_t
}

var proc_wstat32 = modcrt.NewProc(GoString(__ccgo_ts + 661))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wstat32(const wchar_t *_Name,struct _stat32 *_Stat);
func X_wstat32(tls *TLS, __Name uintptr, __Stat uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wstat32.Addr(), __Name, __Stat)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wstat32i64 = modcrt.NewProc(GoString(__ccgo_ts + 670))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wstat32i64(const wchar_t *_Name,struct _stat32i64 *_Stat);
func X_wstat32i64(tls *TLS, __Name uintptr, __Stat uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wstat32i64.Addr(), __Name, __Stat)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wstat64i32 = modcrt.NewProc(GoString(__ccgo_ts + 682))

// int __attribute__((__cdecl__)) _wstat64i32(const wchar_t *_Name,struct _stat64i32 *_Stat);
func X_wstat64i32(tls *TLS, __Name uintptr, __Stat uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wstat64i32.Addr(), __Name, __Stat)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wstat64 = modcrt.NewProc(GoString(__ccgo_ts + 694))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wstat64(const wchar_t *_Name,struct _stat64 *_Stat);
func X_wstat64(tls *TLS, __Name uintptr, __Stat uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wstat64.Addr(), __Name, __Stat)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_cgetws = modcrt.NewProc(GoString(__ccgo_ts + 703))

// __attribute__ ((__dllimport__)) wchar_t *_cgetws(wchar_t *_Buffer);
func X_cgetws(tls *TLS, __Buffer uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_cgetws.Addr(), __Buffer)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_getwch = modcrt.NewProc(GoString(__ccgo_ts + 711))

// __attribute__ ((__dllimport__)) wint_t __attribute__((__cdecl__)) _getwch(void);
func X_getwch(tls *TLS) (r Twint_t) {
	r0, _, err := syscall.SyscallN(proc_getwch.Addr())
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Twint_t(r0)
}

var proc_getwche = modcrt.NewProc(GoString(__ccgo_ts + 719))

// __attribute__ ((__dllimport__)) wint_t __attribute__((__cdecl__)) _getwche(void);
func X_getwche(tls *TLS) (r Twint_t) {
	r0, _, err := syscall.SyscallN(proc_getwche.Addr())
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Twint_t(r0)
}

var proc_putwch = modcrt.NewProc(GoString(__ccgo_ts + 728))

// __attribute__ ((__dllimport__)) wint_t __attribute__((__cdecl__)) _putwch(wchar_t _WCh);
func X_putwch(tls *TLS, __WCh Twchar_t) (r Twint_t) {
	r0, _, err := syscall.SyscallN(proc_putwch.Addr(), uintptr(__WCh))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Twint_t(r0)
}

var proc_ungetwch = modcrt.NewProc(GoString(__ccgo_ts + 736))

// __attribute__ ((__dllimport__)) wint_t __attribute__((__cdecl__)) _ungetwch(wint_t _WCh);
func X_ungetwch(tls *TLS, __WCh Twint_t) (r Twint_t) {
	r0, _, err := syscall.SyscallN(proc_ungetwch.Addr(), uintptr(__WCh))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Twint_t(r0)
}

var proc_cputws = modcrt.NewProc(GoString(__ccgo_ts + 746))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _cputws(const wchar_t *_String);
func X_cputws(tls *TLS, __String uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_cputws.Addr(), __String)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vcwprintf = modcrt.NewProc(GoString(__ccgo_ts + 754))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vcwprintf(const wchar_t * __restrict__ _Format,va_list _ArgList);
func X_vcwprintf(tls *TLS, __Format uintptr, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vcwprintf.Addr(), __Format, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vcwprintf_p = modcrt.NewProc(GoString(__ccgo_ts + 765))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vcwprintf_p(const wchar_t * __restrict__ _Format,va_list _ArgList);
func X_vcwprintf_p(tls *TLS, __Format uintptr, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vcwprintf_p.Addr(), __Format, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vcwprintf_l = modcrt.NewProc(GoString(__ccgo_ts + 778))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vcwprintf_l(const wchar_t * __restrict__ _Format,_locale_t _Locale,va_list _ArgList);
func X_vcwprintf_l(tls *TLS, __Format uintptr, __Locale T_locale_t, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vcwprintf_l.Addr(), __Format, __Locale, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vcwprintf_p_l = modcrt.NewProc(GoString(__ccgo_ts + 791))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vcwprintf_p_l(const wchar_t * __restrict__ _Format,_locale_t _Locale,va_list _ArgList);
func X_vcwprintf_p_l(tls *TLS, __Format uintptr, __Locale T_locale_t, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vcwprintf_p_l.Addr(), __Format, __Locale, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc__mingw_vwscanf = modcrt.NewProc(GoString(__ccgo_ts + 806))

// __attribute__ ((__nonnull__ (1))) int __attribute__((__cdecl__)) __mingw_vwscanf(const wchar_t * __restrict__ Format, va_list argp);
func X__mingw_vwscanf(tls *TLS, _Format uintptr, _argp Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc__mingw_vwscanf.Addr(), _Format, _argp)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc__mingw_vwprintf = modcrt.NewProc(GoString(__ccgo_ts + 822))

// __attribute__ ((__nonnull__ (1))) int __attribute__((__cdecl__)) __mingw_vwprintf(const wchar_t * __restrict__ _Format,va_list _ArgList);
func X__mingw_vwprintf(tls *TLS, __Format uintptr, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc__mingw_vwprintf.Addr(), __Format, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc__mingw_vswprintf = modcrt.NewProc(GoString(__ccgo_ts + 839))

// __attribute__ ((__nonnull__ (2))) int __attribute__((__cdecl__)) __mingw_vswprintf(wchar_t * __restrict__ , const wchar_t * __restrict__ ,va_list);
func X__mingw_vswprintf(tls *TLS, _0 uintptr, _1 uintptr, _2 Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc__mingw_vswprintf.Addr(), _0, _1, _2)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc__ms_vfwprintf = modcrt.NewProc(GoString(__ccgo_ts + 857))

// __attribute__ ((__nonnull__ (2))) int __attribute__((__cdecl__)) __ms_vfwprintf(FILE * __restrict__ _File,const wchar_t * __restrict__ _Format,va_list _ArgList);
func X__ms_vfwprintf(tls *TLS, __File uintptr, __Format uintptr, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc__ms_vfwprintf.Addr(), __File, __Format, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc__ms_vwprintf = modcrt.NewProc(GoString(__ccgo_ts + 872))

// __attribute__ ((__nonnull__ (1))) int __attribute__((__cdecl__)) __ms_vwprintf(const wchar_t * __restrict__ _Format,va_list _ArgList);
func X__ms_vwprintf(tls *TLS, __Format uintptr, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc__ms_vwprintf.Addr(), __Format, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc__ms_vswprintf = modcrt.NewProc(GoString(__ccgo_ts + 886))

// __attribute__ ((__nonnull__ (2))) int __attribute__((__cdecl__)) __ms_vswprintf(wchar_t * __restrict__ , const wchar_t * __restrict__ ,va_list);
func X__ms_vswprintf(tls *TLS, _0 uintptr, _1 uintptr, _2 Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc__ms_vswprintf.Addr(), _0, _1, _2)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wfsopen = modcrt.NewProc(GoString(__ccgo_ts + 901))

// __attribute__ ((__dllimport__)) FILE * __attribute__((__cdecl__)) _wfsopen(const wchar_t *_Filename,const wchar_t *_Mode,int _ShFlag);
func X_wfsopen(tls *TLS, __Filename uintptr, __Mode uintptr, __ShFlag int32) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wfsopen.Addr(), __Filename, __Mode, uintptr(__ShFlag))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procfgetwc = modcrt.NewProc(GoString(__ccgo_ts + 910))

// wint_t __attribute__((__cdecl__)) fgetwc(FILE *_File);
func Xfgetwc(tls *TLS, __File uintptr) (r Twint_t) {
	r0, _, err := syscall.SyscallN(procfgetwc.Addr(), __File)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Twint_t(r0)
}

var proc_fgetwchar = modcrt.NewProc(GoString(__ccgo_ts + 917))

// __attribute__ ((__dllimport__)) wint_t __attribute__((__cdecl__)) _fgetwchar(void);
func X_fgetwchar(tls *TLS) (r Twint_t) {
	r0, _, err := syscall.SyscallN(proc_fgetwchar.Addr())
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Twint_t(r0)
}

var procfputwc = modcrt.NewProc(GoString(__ccgo_ts + 928))

// wint_t __attribute__((__cdecl__)) fputwc(wchar_t _Ch,FILE *_File);
func Xfputwc(tls *TLS, __Ch Twchar_t, __File uintptr) (r Twint_t) {
	r0, _, err := syscall.SyscallN(procfputwc.Addr(), uintptr(__Ch), __File)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Twint_t(r0)
}

var proc_fputwchar = modcrt.NewProc(GoString(__ccgo_ts + 935))

// __attribute__ ((__dllimport__)) wint_t __attribute__((__cdecl__)) _fputwchar(wchar_t _Ch);
func X_fputwchar(tls *TLS, __Ch Twchar_t) (r Twint_t) {
	r0, _, err := syscall.SyscallN(proc_fputwchar.Addr(), uintptr(__Ch))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Twint_t(r0)
}

var procgetwc = modcrt.NewProc(GoString(__ccgo_ts + 946))

// wint_t __attribute__((__cdecl__)) getwc(FILE *_File);
func Xgetwc(tls *TLS, __File uintptr) (r Twint_t) {
	r0, _, err := syscall.SyscallN(procgetwc.Addr(), __File)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Twint_t(r0)
}

var procgetwchar = modcrt.NewProc(GoString(__ccgo_ts + 952))

// wint_t __attribute__((__cdecl__)) getwchar(void);
func Xgetwchar(tls *TLS) (r Twint_t) {
	r0, _, err := syscall.SyscallN(procgetwchar.Addr())
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Twint_t(r0)
}

var procputwc = modcrt.NewProc(GoString(__ccgo_ts + 961))

// wint_t __attribute__((__cdecl__)) putwc(wchar_t _Ch,FILE *_File);
func Xputwc(tls *TLS, __Ch Twchar_t, __File uintptr) (r Twint_t) {
	r0, _, err := syscall.SyscallN(procputwc.Addr(), uintptr(__Ch), __File)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Twint_t(r0)
}

var procputwchar = modcrt.NewProc(GoString(__ccgo_ts + 967))

// wint_t __attribute__((__cdecl__)) putwchar(wchar_t _Ch);
func Xputwchar(tls *TLS, __Ch Twchar_t) (r Twint_t) {
	r0, _, err := syscall.SyscallN(procputwchar.Addr(), uintptr(__Ch))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Twint_t(r0)
}

var procungetwc = modcrt.NewProc(GoString(__ccgo_ts + 976))

// wint_t __attribute__((__cdecl__)) ungetwc(wint_t _Ch,FILE *_File);
func Xungetwc(tls *TLS, __Ch Twint_t, __File uintptr) (r Twint_t) {
	r0, _, err := syscall.SyscallN(procungetwc.Addr(), uintptr(__Ch), __File)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Twint_t(r0)
}

var procfgetws = modcrt.NewProc(GoString(__ccgo_ts + 984))

// wchar_t * __attribute__((__cdecl__)) fgetws(wchar_t * __restrict__ _Dst,int _SizeInWords,FILE * __restrict__ _File);
func Xfgetws(tls *TLS, __Dst uintptr, __SizeInWords int32, __File uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(procfgetws.Addr(), __Dst, uintptr(__SizeInWords), __File)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procfputws = modcrt.NewProc(GoString(__ccgo_ts + 991))

// int __attribute__((__cdecl__)) fputws(const wchar_t * __restrict__ _Str,FILE * __restrict__ _File);
func Xfputws(tls *TLS, __Str uintptr, __File uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(procfputws.Addr(), __Str, __File)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_getws = modcrt.NewProc(GoString(__ccgo_ts + 998))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _getws(wchar_t *_String);
func X_getws(tls *TLS, __String uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_getws.Addr(), __String)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_putws = modcrt.NewProc(GoString(__ccgo_ts + 1005))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _putws(const wchar_t *_Str);
func X_putws(tls *TLS, __Str uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_putws.Addr(), __Str)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vswprintf_c = modcrt.NewProc(GoString(__ccgo_ts + 1012))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vswprintf_c(wchar_t * __restrict__ _DstBuf,size_t _SizeInWords,const wchar_t * __restrict__ _Format,va_list _ArgList);
func X_vswprintf_c(tls *TLS, __DstBuf uintptr, __SizeInWords Tsize_t, __Format uintptr, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vswprintf_c.Addr(), __DstBuf, uintptr(__SizeInWords), __Format, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vfwprintf_p = modcrt.NewProc(GoString(__ccgo_ts + 1025))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vfwprintf_p(FILE * __restrict__ _File,const wchar_t * __restrict__ _Format,va_list _ArgList);
func X_vfwprintf_p(tls *TLS, __File uintptr, __Format uintptr, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vfwprintf_p.Addr(), __File, __Format, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vwprintf_p = modcrt.NewProc(GoString(__ccgo_ts + 1038))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vwprintf_p(const wchar_t * __restrict__ _Format,va_list _ArgList);
func X_vwprintf_p(tls *TLS, __Format uintptr, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vwprintf_p.Addr(), __Format, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vswprintf_p = modcrt.NewProc(GoString(__ccgo_ts + 1050))

// __attribute__((dllimport)) int __attribute__((__cdecl__)) _vswprintf_p(wchar_t * __restrict__ _DstBuf,size_t _MaxCount,const wchar_t * __restrict__ _Format,va_list _ArgList);
func X_vswprintf_p(tls *TLS, __DstBuf uintptr, __MaxCount Tsize_t, __Format uintptr, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vswprintf_p.Addr(), __DstBuf, uintptr(__MaxCount), __Format, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vscwprintf_p = modcrt.NewProc(GoString(__ccgo_ts + 1063))

// __attribute__((dllimport)) int __attribute__((__cdecl__)) _vscwprintf_p(const wchar_t * __restrict__ _Format,va_list _ArgList);
func X_vscwprintf_p(tls *TLS, __Format uintptr, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vscwprintf_p.Addr(), __Format, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vwprintf_l = modcrt.NewProc(GoString(__ccgo_ts + 1077))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vwprintf_l(const wchar_t * __restrict__ _Format,_locale_t _Locale,va_list _ArgList);
func X_vwprintf_l(tls *TLS, __Format uintptr, __Locale T_locale_t, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vwprintf_l.Addr(), __Format, __Locale, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vwprintf_p_l = modcrt.NewProc(GoString(__ccgo_ts + 1089))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vwprintf_p_l(const wchar_t * __restrict__ _Format,_locale_t _Locale,va_list _ArgList);
func X_vwprintf_p_l(tls *TLS, __Format uintptr, __Locale T_locale_t, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vwprintf_p_l.Addr(), __Format, __Locale, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vfwprintf_l = modcrt.NewProc(GoString(__ccgo_ts + 1103))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vfwprintf_l(FILE * __restrict__ _File,const wchar_t * __restrict__ _Format,_locale_t _Locale,va_list _ArgList);
func X_vfwprintf_l(tls *TLS, __File uintptr, __Format uintptr, __Locale T_locale_t, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vfwprintf_l.Addr(), __File, __Format, __Locale, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vfwprintf_p_l = modcrt.NewProc(GoString(__ccgo_ts + 1116))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vfwprintf_p_l(FILE * __restrict__ _File,const wchar_t * __restrict__ _Format,_locale_t _Locale,va_list _ArgList);
func X_vfwprintf_p_l(tls *TLS, __File uintptr, __Format uintptr, __Locale T_locale_t, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vfwprintf_p_l.Addr(), __File, __Format, __Locale, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vswprintf_c_l = modcrt.NewProc(GoString(__ccgo_ts + 1131))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vswprintf_c_l(wchar_t * __restrict__ _DstBuf,size_t _MaxCount,const wchar_t * __restrict__ _Format,_locale_t _Locale,va_list _ArgList);
func X_vswprintf_c_l(tls *TLS, __DstBuf uintptr, __MaxCount Tsize_t, __Format uintptr, __Locale T_locale_t, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vswprintf_c_l.Addr(), __DstBuf, uintptr(__MaxCount), __Format, __Locale, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vswprintf_p_l = modcrt.NewProc(GoString(__ccgo_ts + 1146))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vswprintf_p_l(wchar_t * __restrict__ _DstBuf,size_t _MaxCount,const wchar_t * __restrict__ _Format,_locale_t _Locale,va_list _ArgList);
func X_vswprintf_p_l(tls *TLS, __DstBuf uintptr, __MaxCount Tsize_t, __Format uintptr, __Locale T_locale_t, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vswprintf_p_l.Addr(), __DstBuf, uintptr(__MaxCount), __Format, __Locale, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vscwprintf_p_l = modcrt.NewProc(GoString(__ccgo_ts + 1161))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vscwprintf_p_l(const wchar_t * __restrict__ _Format,_locale_t _Locale,va_list _ArgList);
func X_vscwprintf_p_l(tls *TLS, __Format uintptr, __Locale T_locale_t, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vscwprintf_p_l.Addr(), __Format, __Locale, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vsnwprintf_l = modcrt.NewProc(GoString(__ccgo_ts + 1177))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vsnwprintf_l(wchar_t * __restrict__ _DstBuf,size_t _MaxCount,const wchar_t * __restrict__ _Format,_locale_t _Locale,va_list _ArgList);
func X_vsnwprintf_l(tls *TLS, __DstBuf uintptr, __MaxCount Tsize_t, __Format uintptr, __Locale T_locale_t, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vsnwprintf_l.Addr(), __DstBuf, uintptr(__MaxCount), __Format, __Locale, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vswprintf = modcrt.NewProc(GoString(__ccgo_ts + 1191))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vswprintf(wchar_t * __restrict__ _Dest,const wchar_t * __restrict__ _Format,va_list _Args);
func X_vswprintf(tls *TLS, __Dest uintptr, __Format uintptr, __Args Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vswprintf.Addr(), __Dest, __Format, __Args)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vswprintf_l = modcrt.NewProc(GoString(__ccgo_ts + 1202))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vswprintf_l(wchar_t * __restrict__ _Dest,size_t _MaxCount,const wchar_t * __restrict__ _Format,_locale_t _Locale,va_list _ArgList);
func X_vswprintf_l(tls *TLS, __Dest uintptr, __MaxCount Tsize_t, __Format uintptr, __Locale T_locale_t, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vswprintf_l.Addr(), __Dest, uintptr(__MaxCount), __Format, __Locale, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc__vswprintf_l = modcrt.NewProc(GoString(__ccgo_ts + 1215))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) __vswprintf_l(wchar_t * __restrict__ _Dest,const wchar_t * __restrict__ _Format,_locale_t _Plocinfo,va_list _Args);
func X__vswprintf_l(tls *TLS, __Dest uintptr, __Format uintptr, __Plocinfo T_locale_t, __Args Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc__vswprintf_l.Addr(), __Dest, __Format, __Plocinfo, __Args)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wtempnam = modcrt.NewProc(GoString(__ccgo_ts + 1229))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _wtempnam(const wchar_t *_Directory,const wchar_t *_FilePrefix);
func X_wtempnam(tls *TLS, __Directory uintptr, __FilePrefix uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wtempnam.Addr(), __Directory, __FilePrefix)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_vscwprintf = modcrt.NewProc(GoString(__ccgo_ts + 1239))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vscwprintf(const wchar_t * __restrict__ _Format,va_list _ArgList);
func X_vscwprintf(tls *TLS, __Format uintptr, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vscwprintf.Addr(), __Format, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_vscwprintf_l = modcrt.NewProc(GoString(__ccgo_ts + 1251))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _vscwprintf_l(const wchar_t * __restrict__ _Format,_locale_t _Locale,va_list _ArgList);
func X_vscwprintf_l(tls *TLS, __Format uintptr, __Locale T_locale_t, __ArgList Tva_list) (r int32) {
	r0, _, err := syscall.SyscallN(proc_vscwprintf_l.Addr(), __Format, __Locale, __ArgList)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wfdopen = modcrt.NewProc(GoString(__ccgo_ts + 1265))

// __attribute__ ((__dllimport__)) FILE * __attribute__((__cdecl__)) _wfdopen(int _FileHandle ,const wchar_t *_Mode);
func X_wfdopen(tls *TLS, __FileHandle int32, __Mode uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wfdopen.Addr(), uintptr(__FileHandle), __Mode)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wfopen = modcrt.NewProc(GoString(__ccgo_ts + 1274))

// __attribute__ ((__dllimport__)) FILE * __attribute__((__cdecl__)) _wfopen(const wchar_t * __restrict__ _Filename,const wchar_t * __restrict__ _Mode);
func X_wfopen(tls *TLS, __Filename uintptr, __Mode uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wfopen.Addr(), __Filename, __Mode)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wfreopen = modcrt.NewProc(GoString(__ccgo_ts + 1282))

// __attribute__ ((__dllimport__)) FILE * __attribute__((__cdecl__)) _wfreopen(const wchar_t * __restrict__ _Filename,const wchar_t * __restrict__ _Mode,FILE * __restrict__ _OldFile);
func X_wfreopen(tls *TLS, __Filename uintptr, __Mode uintptr, __OldFile uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wfreopen.Addr(), __Filename, __Mode, __OldFile)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wperror = modcrt.NewProc(GoString(__ccgo_ts + 1292))

// __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _wperror(const wchar_t *_ErrMsg);
func X_wperror(tls *TLS, __ErrMsg uintptr) {
	_, _, err := syscall.SyscallN(proc_wperror.Addr(), __ErrMsg)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
}

var proc_wpopen = modcrt.NewProc(GoString(__ccgo_ts + 1301))

// __attribute__ ((__dllimport__)) FILE * __attribute__((__cdecl__)) _wpopen(const wchar_t *_Command,const wchar_t *_Mode);
func X_wpopen(tls *TLS, __Command uintptr, __Mode uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wpopen.Addr(), __Command, __Mode)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wremove = modcrt.NewProc(GoString(__ccgo_ts + 1309))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wremove(const wchar_t *_Filename);
func X_wremove(tls *TLS, __Filename uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wremove.Addr(), __Filename)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wtmpnam = modcrt.NewProc(GoString(__ccgo_ts + 1318))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _wtmpnam(wchar_t *_Buffer);
func X_wtmpnam(tls *TLS, __Buffer uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wtmpnam.Addr(), __Buffer)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_itow = modcrt.NewProc(GoString(__ccgo_ts + 1327))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _itow(int _Value,wchar_t *_Dest,int _Radix);
func X_itow(tls *TLS, __Value int32, __Dest uintptr, __Radix int32) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_itow.Addr(), uintptr(__Value), __Dest, uintptr(__Radix))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_ltow = modcrt.NewProc(GoString(__ccgo_ts + 1333))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _ltow(long _Value,wchar_t *_Dest,int _Radix);
func X_ltow(tls *TLS, __Value int32, __Dest uintptr, __Radix int32) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_ltow.Addr(), uintptr(__Value), __Dest, uintptr(__Radix))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_ultow = modcrt.NewProc(GoString(__ccgo_ts + 1339))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _ultow(unsigned long _Value,wchar_t *_Dest,int _Radix);
func X_ultow(tls *TLS, __Value uint32, __Dest uintptr, __Radix int32) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_ultow.Addr(), uintptr(__Value), __Dest, uintptr(__Radix))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wcstod_l = modcrt.NewProc(GoString(__ccgo_ts + 1346))

// __attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) _wcstod_l(const wchar_t * __restrict__ _Str,wchar_t ** __restrict__ _EndPtr,_locale_t _Locale);
func X_wcstod_l(tls *TLS, __Str uintptr, __EndPtr uintptr, __Locale T_locale_t) (r float64) {
	r0, _, err := syscall.SyscallN(proc_wcstod_l.Addr(), __Str, __EndPtr, __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return float64(r0)
}

var proc__mingw_wcstod = modcrt.NewProc(GoString(__ccgo_ts + 1356))

// double __attribute__((__cdecl__)) __mingw_wcstod(const wchar_t * __restrict__ _Str,wchar_t ** __restrict__ _EndPtr);
func X__mingw_wcstod(tls *TLS, __Str uintptr, __EndPtr uintptr) (r float64) {
	r0, _, err := syscall.SyscallN(proc__mingw_wcstod.Addr(), __Str, __EndPtr)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return float64(r0)
}

var proc__mingw_wcstof = modcrt.NewProc(GoString(__ccgo_ts + 1371))

// float __attribute__((__cdecl__)) __mingw_wcstof(const wchar_t * __restrict__ nptr, wchar_t ** __restrict__ endptr);
func X__mingw_wcstof(tls *TLS, _nptr uintptr, _endptr uintptr) (r float32) {
	r0, _, err := syscall.SyscallN(proc__mingw_wcstof.Addr(), _nptr, _endptr)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return float32(r0)
}

var proc__mingw_wcstold = modcrt.NewProc(GoString(__ccgo_ts + 1386))

// long double __attribute__((__cdecl__)) __mingw_wcstold(const wchar_t * __restrict__, wchar_t ** __restrict__);
func X__mingw_wcstold(tls *TLS, _0 uintptr, _1 uintptr) (r float64) {
	r0, _, err := syscall.SyscallN(proc__mingw_wcstold.Addr(), _0, _1)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return float64(r0)
}

var procwcstold = modcrt.NewProc(GoString(__ccgo_ts + 1402))

// long double __attribute__((__cdecl__)) wcstold (const wchar_t * __restrict__, wchar_t ** __restrict__);
func Xwcstold(tls *TLS, _0 uintptr, _1 uintptr) (r float64) {
	r0, _, err := syscall.SyscallN(procwcstold.Addr(), _0, _1)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return float64(r0)
}

var procwcstol = modcrt.NewProc(GoString(__ccgo_ts + 1410))

// long __attribute__((__cdecl__)) wcstol(const wchar_t * __restrict__ _Str,wchar_t ** __restrict__ _EndPtr,int _Radix);
func Xwcstol(tls *TLS, __Str uintptr, __EndPtr uintptr, __Radix int32) (r int32) {
	r0, _, err := syscall.SyscallN(procwcstol.Addr(), __Str, __EndPtr, uintptr(__Radix))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wcstol_l = modcrt.NewProc(GoString(__ccgo_ts + 1417))

// __attribute__ ((__dllimport__)) long __attribute__((__cdecl__)) _wcstol_l(const wchar_t * __restrict__ _Str,wchar_t ** __restrict__ _EndPtr,int _Radix,_locale_t _Locale);
func X_wcstol_l(tls *TLS, __Str uintptr, __EndPtr uintptr, __Radix int32, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wcstol_l.Addr(), __Str, __EndPtr, uintptr(__Radix), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var procwcstoul = modcrt.NewProc(GoString(__ccgo_ts + 1427))

// unsigned long __attribute__((__cdecl__)) wcstoul(const wchar_t * __restrict__ _Str,wchar_t ** __restrict__ _EndPtr,int _Radix);
func Xwcstoul(tls *TLS, __Str uintptr, __EndPtr uintptr, __Radix int32) (r uint32) {
	r0, _, err := syscall.SyscallN(procwcstoul.Addr(), __Str, __EndPtr, uintptr(__Radix))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uint32(r0)
}

var proc_wcstoul_l = modcrt.NewProc(GoString(__ccgo_ts + 1435))

// __attribute__ ((__dllimport__)) unsigned long __attribute__((__cdecl__)) _wcstoul_l(const wchar_t * __restrict__ _Str,wchar_t ** __restrict__ _EndPtr,int _Radix,_locale_t _Locale);
func X_wcstoul_l(tls *TLS, __Str uintptr, __EndPtr uintptr, __Radix int32, __Locale T_locale_t) (r uint32) {
	r0, _, err := syscall.SyscallN(proc_wcstoul_l.Addr(), __Str, __EndPtr, uintptr(__Radix), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uint32(r0)
}

var proc_wtof = modcrt.NewProc(GoString(__ccgo_ts + 1446))

// __attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) _wtof(const wchar_t *_Str);
func X_wtof(tls *TLS, __Str uintptr) (r float64) {
	r0, _, err := syscall.SyscallN(proc_wtof.Addr(), __Str)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return float64(r0)
}

var proc_wtof_l = modcrt.NewProc(GoString(__ccgo_ts + 1452))

// __attribute__ ((__dllimport__)) double __attribute__((__cdecl__)) _wtof_l(const wchar_t *_Str,_locale_t _Locale);
func X_wtof_l(tls *TLS, __Str uintptr, __Locale T_locale_t) (r float64) {
	r0, _, err := syscall.SyscallN(proc_wtof_l.Addr(), __Str, __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return float64(r0)
}

var proc_wtoi_l = modcrt.NewProc(GoString(__ccgo_ts + 1460))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wtoi_l(const wchar_t *_Str,_locale_t _Locale);
func X_wtoi_l(tls *TLS, __Str uintptr, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wtoi_l.Addr(), __Str, __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wtol = modcrt.NewProc(GoString(__ccgo_ts + 1468))

// __attribute__ ((__dllimport__)) long __attribute__((__cdecl__)) _wtol(const wchar_t *_Str);
func X_wtol(tls *TLS, __Str uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wtol.Addr(), __Str)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wtol_l = modcrt.NewProc(GoString(__ccgo_ts + 1474))

// __attribute__ ((__dllimport__)) long __attribute__((__cdecl__)) _wtol_l(const wchar_t *_Str,_locale_t _Locale);
func X_wtol_l(tls *TLS, __Str uintptr, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wtol_l.Addr(), __Str, __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_i64tow = modcrt.NewProc(GoString(__ccgo_ts + 1482))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _i64tow( long long _Val,wchar_t *_DstBuf,int _Radix);
func X_i64tow(tls *TLS, __Val int64, __DstBuf uintptr, __Radix int32) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_i64tow.Addr(), uintptr(__Val), __DstBuf, uintptr(__Radix))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_ui64tow = modcrt.NewProc(GoString(__ccgo_ts + 1490))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _ui64tow(unsigned long long _Val,wchar_t *_DstBuf,int _Radix);
func X_ui64tow(tls *TLS, __Val uint64, __DstBuf uintptr, __Radix int32) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_ui64tow.Addr(), uintptr(__Val), __DstBuf, uintptr(__Radix))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wtoi64 = modcrt.NewProc(GoString(__ccgo_ts + 1499))

// __attribute__ ((__dllimport__)) long long __attribute__((__cdecl__)) _wtoi64(const wchar_t *_Str);
func X_wtoi64(tls *TLS, __Str uintptr) (r int64) {
	r0, _, err := syscall.SyscallN(proc_wtoi64.Addr(), __Str)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int64(r0)
}

var proc_wtoi64_l = modcrt.NewProc(GoString(__ccgo_ts + 1507))

// __attribute__ ((__dllimport__)) long long __attribute__((__cdecl__)) _wtoi64_l(const wchar_t *_Str,_locale_t _Locale);
func X_wtoi64_l(tls *TLS, __Str uintptr, __Locale T_locale_t) (r int64) {
	r0, _, err := syscall.SyscallN(proc_wtoi64_l.Addr(), __Str, __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int64(r0)
}

var proc_wcstoi64 = modcrt.NewProc(GoString(__ccgo_ts + 1517))

// __attribute__ ((__dllimport__)) long long __attribute__((__cdecl__)) _wcstoi64(const wchar_t *_Str,wchar_t **_EndPtr,int _Radix);
func X_wcstoi64(tls *TLS, __Str uintptr, __EndPtr uintptr, __Radix int32) (r int64) {
	r0, _, err := syscall.SyscallN(proc_wcstoi64.Addr(), __Str, __EndPtr, uintptr(__Radix))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int64(r0)
}

var proc_wcstoi64_l = modcrt.NewProc(GoString(__ccgo_ts + 1527))

// __attribute__ ((__dllimport__)) long long __attribute__((__cdecl__)) _wcstoi64_l(const wchar_t *_Str,wchar_t **_EndPtr,int _Radix,_locale_t _Locale);
func X_wcstoi64_l(tls *TLS, __Str uintptr, __EndPtr uintptr, __Radix int32, __Locale T_locale_t) (r int64) {
	r0, _, err := syscall.SyscallN(proc_wcstoi64_l.Addr(), __Str, __EndPtr, uintptr(__Radix), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int64(r0)
}

var proc_wcstoui64 = modcrt.NewProc(GoString(__ccgo_ts + 1539))

// __attribute__ ((__dllimport__)) unsigned long long __attribute__((__cdecl__)) _wcstoui64(const wchar_t *_Str,wchar_t **_EndPtr,int _Radix);
func X_wcstoui64(tls *TLS, __Str uintptr, __EndPtr uintptr, __Radix int32) (r uint64) {
	r0, _, err := syscall.SyscallN(proc_wcstoui64.Addr(), __Str, __EndPtr, uintptr(__Radix))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uint64(r0)
}

var proc_wcstoui64_l = modcrt.NewProc(GoString(__ccgo_ts + 1550))

// __attribute__ ((__dllimport__)) unsigned long long __attribute__((__cdecl__)) _wcstoui64_l(const wchar_t *_Str,wchar_t **_EndPtr,int _Radix,_locale_t _Locale);
func X_wcstoui64_l(tls *TLS, __Str uintptr, __EndPtr uintptr, __Radix int32, __Locale T_locale_t) (r uint64) {
	r0, _, err := syscall.SyscallN(proc_wcstoui64_l.Addr(), __Str, __EndPtr, uintptr(__Radix), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uint64(r0)
}

var proc_wfullpath = modcrt.NewProc(GoString(__ccgo_ts + 1563))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _wfullpath(wchar_t *_FullPath,const wchar_t *_Path,size_t _SizeInWords);
func X_wfullpath(tls *TLS, __FullPath uintptr, __Path uintptr, __SizeInWords Tsize_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wfullpath.Addr(), __FullPath, __Path, uintptr(__SizeInWords))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wmakepath = modcrt.NewProc(GoString(__ccgo_ts + 1574))

// __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _wmakepath(wchar_t *_ResultPath,const wchar_t *_Drive,const wchar_t *_Dir,const wchar_t *_Filename,const wchar_t *_Ext);
func X_wmakepath(tls *TLS, __ResultPath uintptr, __Drive uintptr, __Dir uintptr, __Filename uintptr, __Ext uintptr) {
	_, _, err := syscall.SyscallN(proc_wmakepath.Addr(), __ResultPath, __Drive, __Dir, __Filename, __Ext)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
}

var proc_wsearchenv = modcrt.NewProc(GoString(__ccgo_ts + 1585))

// __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _wsearchenv(const wchar_t *_Filename,const wchar_t *_EnvVar,wchar_t *_ResultPath);
func X_wsearchenv(tls *TLS, __Filename uintptr, __EnvVar uintptr, __ResultPath uintptr) {
	_, _, err := syscall.SyscallN(proc_wsearchenv.Addr(), __Filename, __EnvVar, __ResultPath)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
}

var proc_wsplitpath = modcrt.NewProc(GoString(__ccgo_ts + 1597))

// __attribute__ ((__dllimport__)) void __attribute__((__cdecl__)) _wsplitpath(const wchar_t *_FullPath,wchar_t *_Drive,wchar_t *_Dir,wchar_t *_Filename,wchar_t *_Ext);
func X_wsplitpath(tls *TLS, __FullPath uintptr, __Drive uintptr, __Dir uintptr, __Filename uintptr, __Ext uintptr) {
	_, _, err := syscall.SyscallN(proc_wsplitpath.Addr(), __FullPath, __Drive, __Dir, __Filename, __Ext)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
}

var proc_wcsdup = modcrt.NewProc(GoString(__ccgo_ts + 1609))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _wcsdup(const wchar_t *_Str);
func X_wcsdup(tls *TLS, __Str uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wcsdup.Addr(), __Str)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procwcscat = modcrt.NewProc(GoString(__ccgo_ts + 1617))

// wchar_t * __attribute__((__cdecl__)) wcscat(wchar_t * __restrict__ _Dest,const wchar_t * __restrict__ _Source);
func Xwcscat(tls *TLS, __Dest uintptr, __Source uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(procwcscat.Addr(), __Dest, __Source)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procwcscspn = modcrt.NewProc(GoString(__ccgo_ts + 1624))

// size_t __attribute__((__cdecl__)) wcscspn(const wchar_t *_Str,const wchar_t *_Control);
func Xwcscspn(tls *TLS, __Str uintptr, __Control uintptr) (r Tsize_t) {
	r0, _, err := syscall.SyscallN(procwcscspn.Addr(), __Str, __Control)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tsize_t(r0)
}

var procwcsnlen = modcrt.NewProc(GoString(__ccgo_ts + 1632))

// size_t __attribute__((__cdecl__)) wcsnlen(const wchar_t *_Src,size_t _MaxCount);
func Xwcsnlen(tls *TLS, __Src uintptr, __MaxCount Tsize_t) (r Tsize_t) {
	r0, _, err := syscall.SyscallN(procwcsnlen.Addr(), __Src, uintptr(__MaxCount))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tsize_t(r0)
}

var procwcsncat = modcrt.NewProc(GoString(__ccgo_ts + 1640))

// wchar_t * __attribute__((__cdecl__)) wcsncat(wchar_t * __restrict__ _Dest,const wchar_t * __restrict__ _Source,size_t _Count);
func Xwcsncat(tls *TLS, __Dest uintptr, __Source uintptr, __Count Tsize_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(procwcsncat.Addr(), __Dest, __Source, uintptr(__Count))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procwcsncpy = modcrt.NewProc(GoString(__ccgo_ts + 1648))

// wchar_t * __attribute__((__cdecl__)) wcsncpy(wchar_t * __restrict__ _Dest,const wchar_t * __restrict__ _Source,size_t _Count);
func Xwcsncpy(tls *TLS, __Dest uintptr, __Source uintptr, __Count Tsize_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(procwcsncpy.Addr(), __Dest, __Source, uintptr(__Count))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wcsncpy_l = modcrt.NewProc(GoString(__ccgo_ts + 1656))

// wchar_t * __attribute__((__cdecl__)) _wcsncpy_l(wchar_t * __restrict__ _Dest,const wchar_t * __restrict__ _Source,size_t _Count,_locale_t _Locale);
func X_wcsncpy_l(tls *TLS, __Dest uintptr, __Source uintptr, __Count Tsize_t, __Locale T_locale_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wcsncpy_l.Addr(), __Dest, __Source, uintptr(__Count), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procwcspbrk = modcrt.NewProc(GoString(__ccgo_ts + 1667))

// wchar_t * __attribute__((__cdecl__)) wcspbrk(const wchar_t *_Str,const wchar_t *_Control);
func Xwcspbrk(tls *TLS, __Str uintptr, __Control uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(procwcspbrk.Addr(), __Str, __Control)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procwcsrchr = modcrt.NewProc(GoString(__ccgo_ts + 1675))

// wchar_t * __attribute__((__cdecl__)) wcsrchr(const wchar_t *_Str,wchar_t _Ch);
func Xwcsrchr(tls *TLS, __Str uintptr, __Ch Twchar_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(procwcsrchr.Addr(), __Str, uintptr(__Ch))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procwcsspn = modcrt.NewProc(GoString(__ccgo_ts + 1683))

// size_t __attribute__((__cdecl__)) wcsspn(const wchar_t *_Str,const wchar_t *_Control);
func Xwcsspn(tls *TLS, __Str uintptr, __Control uintptr) (r Tsize_t) {
	r0, _, err := syscall.SyscallN(procwcsspn.Addr(), __Str, __Control)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tsize_t(r0)
}

var procwcsstr = modcrt.NewProc(GoString(__ccgo_ts + 1690))

// wchar_t * __attribute__((__cdecl__)) wcsstr(const wchar_t *_Str,const wchar_t *_SubStr);
func Xwcsstr(tls *TLS, __Str uintptr, __SubStr uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(procwcsstr.Addr(), __Str, __SubStr)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procwcstok = modcrt.NewProc(GoString(__ccgo_ts + 1697))

// wchar_t * __attribute__((__cdecl__)) wcstok(wchar_t * __restrict__ _Str,const wchar_t * __restrict__ _Delim);
func Xwcstok(tls *TLS, __Str uintptr, __Delim uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(procwcstok.Addr(), __Str, __Delim)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wcserror = modcrt.NewProc(GoString(__ccgo_ts + 1704))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _wcserror(int _ErrNum);
func X_wcserror(tls *TLS, __ErrNum int32) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wcserror.Addr(), uintptr(__ErrNum))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc__wcserror = modcrt.NewProc(GoString(__ccgo_ts + 1714))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) __wcserror(const wchar_t *_Str);
func X__wcserror(tls *TLS, __Str uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc__wcserror.Addr(), __Str)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wcsicmp_l = modcrt.NewProc(GoString(__ccgo_ts + 1725))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcsicmp_l(const wchar_t *_Str1,const wchar_t *_Str2,_locale_t _Locale);
func X_wcsicmp_l(tls *TLS, __Str1 uintptr, __Str2 uintptr, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wcsicmp_l.Addr(), __Str1, __Str2, __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wcsnicmp_l = modcrt.NewProc(GoString(__ccgo_ts + 1736))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcsnicmp_l(const wchar_t *_Str1,const wchar_t *_Str2,size_t _MaxCount,_locale_t _Locale);
func X_wcsnicmp_l(tls *TLS, __Str1 uintptr, __Str2 uintptr, __MaxCount Tsize_t, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wcsnicmp_l.Addr(), __Str1, __Str2, uintptr(__MaxCount), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wcsnset = modcrt.NewProc(GoString(__ccgo_ts + 1748))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _wcsnset(wchar_t *_Str,wchar_t _Val,size_t _MaxCount);
func X_wcsnset(tls *TLS, __Str uintptr, __Val Twchar_t, __MaxCount Tsize_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wcsnset.Addr(), __Str, uintptr(__Val), uintptr(__MaxCount))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wcsrev = modcrt.NewProc(GoString(__ccgo_ts + 1757))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _wcsrev(wchar_t *_Str);
func X_wcsrev(tls *TLS, __Str uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wcsrev.Addr(), __Str)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wcsset = modcrt.NewProc(GoString(__ccgo_ts + 1765))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _wcsset(wchar_t *_Str,wchar_t _Val);
func X_wcsset(tls *TLS, __Str uintptr, __Val Twchar_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wcsset.Addr(), __Str, uintptr(__Val))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wcslwr = modcrt.NewProc(GoString(__ccgo_ts + 1773))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _wcslwr(wchar_t *_String);
func X_wcslwr(tls *TLS, __String uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wcslwr.Addr(), __String)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wcslwr_l = modcrt.NewProc(GoString(__ccgo_ts + 1781))

// __attribute__ ((__dllimport__)) wchar_t *_wcslwr_l(wchar_t *_String,_locale_t _Locale);
func X_wcslwr_l(tls *TLS, __String uintptr, __Locale T_locale_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wcslwr_l.Addr(), __String, __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wcsupr = modcrt.NewProc(GoString(__ccgo_ts + 1791))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _wcsupr(wchar_t *_String);
func X_wcsupr(tls *TLS, __String uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wcsupr.Addr(), __String)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wcsupr_l = modcrt.NewProc(GoString(__ccgo_ts + 1799))

// __attribute__ ((__dllimport__)) wchar_t *_wcsupr_l(wchar_t *_String,_locale_t _Locale);
func X_wcsupr_l(tls *TLS, __String uintptr, __Locale T_locale_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wcsupr_l.Addr(), __String, __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procwcsxfrm = modcrt.NewProc(GoString(__ccgo_ts + 1809))

// size_t __attribute__((__cdecl__)) wcsxfrm(wchar_t * __restrict__ _Dst,const wchar_t * __restrict__ _Src,size_t _MaxCount);
func Xwcsxfrm(tls *TLS, __Dst uintptr, __Src uintptr, __MaxCount Tsize_t) (r Tsize_t) {
	r0, _, err := syscall.SyscallN(procwcsxfrm.Addr(), __Dst, __Src, uintptr(__MaxCount))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tsize_t(r0)
}

var proc_wcsxfrm_l = modcrt.NewProc(GoString(__ccgo_ts + 1817))

// __attribute__ ((__dllimport__)) size_t __attribute__((__cdecl__)) _wcsxfrm_l(wchar_t * __restrict__ _Dst,const wchar_t * __restrict__ _Src,size_t _MaxCount,_locale_t _Locale);
func X_wcsxfrm_l(tls *TLS, __Dst uintptr, __Src uintptr, __MaxCount Tsize_t, __Locale T_locale_t) (r Tsize_t) {
	r0, _, err := syscall.SyscallN(proc_wcsxfrm_l.Addr(), __Dst, __Src, uintptr(__MaxCount), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tsize_t(r0)
}

var procwcscoll = modcrt.NewProc(GoString(__ccgo_ts + 1828))

// int __attribute__((__cdecl__)) wcscoll(const wchar_t *_Str1,const wchar_t *_Str2);
func Xwcscoll(tls *TLS, __Str1 uintptr, __Str2 uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(procwcscoll.Addr(), __Str1, __Str2)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wcscoll_l = modcrt.NewProc(GoString(__ccgo_ts + 1836))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcscoll_l(const wchar_t *_Str1,const wchar_t *_Str2,_locale_t _Locale);
func X_wcscoll_l(tls *TLS, __Str1 uintptr, __Str2 uintptr, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wcscoll_l.Addr(), __Str1, __Str2, __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wcsicoll = modcrt.NewProc(GoString(__ccgo_ts + 1847))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcsicoll(const wchar_t *_Str1,const wchar_t *_Str2);
func X_wcsicoll(tls *TLS, __Str1 uintptr, __Str2 uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wcsicoll.Addr(), __Str1, __Str2)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wcsicoll_l = modcrt.NewProc(GoString(__ccgo_ts + 1857))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcsicoll_l(const wchar_t *_Str1,const wchar_t *_Str2,_locale_t _Locale);
func X_wcsicoll_l(tls *TLS, __Str1 uintptr, __Str2 uintptr, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wcsicoll_l.Addr(), __Str1, __Str2, __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wcsncoll = modcrt.NewProc(GoString(__ccgo_ts + 1869))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcsncoll(const wchar_t *_Str1,const wchar_t *_Str2,size_t _MaxCount);
func X_wcsncoll(tls *TLS, __Str1 uintptr, __Str2 uintptr, __MaxCount Tsize_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wcsncoll.Addr(), __Str1, __Str2, uintptr(__MaxCount))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wcsncoll_l = modcrt.NewProc(GoString(__ccgo_ts + 1879))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcsncoll_l(const wchar_t *_Str1,const wchar_t *_Str2,size_t _MaxCount,_locale_t _Locale);
func X_wcsncoll_l(tls *TLS, __Str1 uintptr, __Str2 uintptr, __MaxCount Tsize_t, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wcsncoll_l.Addr(), __Str1, __Str2, uintptr(__MaxCount), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wcsnicoll = modcrt.NewProc(GoString(__ccgo_ts + 1891))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcsnicoll(const wchar_t *_Str1,const wchar_t *_Str2,size_t _MaxCount);
func X_wcsnicoll(tls *TLS, __Str1 uintptr, __Str2 uintptr, __MaxCount Tsize_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wcsnicoll.Addr(), __Str1, __Str2, uintptr(__MaxCount))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_wcsnicoll_l = modcrt.NewProc(GoString(__ccgo_ts + 1902))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _wcsnicoll_l(const wchar_t *_Str1,const wchar_t *_Str2,size_t _MaxCount,_locale_t _Locale);
func X_wcsnicoll_l(tls *TLS, __Str1 uintptr, __Str2 uintptr, __MaxCount Tsize_t, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_wcsnicoll_l.Addr(), __Str1, __Str2, uintptr(__MaxCount), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var procwcsdup = modcrt.NewProc(GoString(__ccgo_ts + 1915))

// wchar_t * __attribute__((__cdecl__)) wcsdup(const wchar_t *_Str);
func Xwcsdup(tls *TLS, __Str uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(procwcsdup.Addr(), __Str)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procwcsnicmp = modcrt.NewProc(GoString(__ccgo_ts + 1922))

// int __attribute__((__cdecl__)) wcsnicmp(const wchar_t *_Str1,const wchar_t *_Str2,size_t _MaxCount);
func Xwcsnicmp(tls *TLS, __Str1 uintptr, __Str2 uintptr, __MaxCount Tsize_t) (r int32) {
	r0, _, err := syscall.SyscallN(procwcsnicmp.Addr(), __Str1, __Str2, uintptr(__MaxCount))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var procwcsnset = modcrt.NewProc(GoString(__ccgo_ts + 1931))

// wchar_t * __attribute__((__cdecl__)) wcsnset(wchar_t *_Str,wchar_t _Val,size_t _MaxCount);
func Xwcsnset(tls *TLS, __Str uintptr, __Val Twchar_t, __MaxCount Tsize_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(procwcsnset.Addr(), __Str, uintptr(__Val), uintptr(__MaxCount))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procwcsrev = modcrt.NewProc(GoString(__ccgo_ts + 1939))

// wchar_t * __attribute__((__cdecl__)) wcsrev(wchar_t *_Str);
func Xwcsrev(tls *TLS, __Str uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(procwcsrev.Addr(), __Str)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procwcsset = modcrt.NewProc(GoString(__ccgo_ts + 1946))

// wchar_t * __attribute__((__cdecl__)) wcsset(wchar_t *_Str,wchar_t _Val);
func Xwcsset(tls *TLS, __Str uintptr, __Val Twchar_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(procwcsset.Addr(), __Str, uintptr(__Val))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procwcslwr = modcrt.NewProc(GoString(__ccgo_ts + 1953))

// wchar_t * __attribute__((__cdecl__)) wcslwr(wchar_t *_Str);
func Xwcslwr(tls *TLS, __Str uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(procwcslwr.Addr(), __Str)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procwcsupr = modcrt.NewProc(GoString(__ccgo_ts + 1960))

// wchar_t * __attribute__((__cdecl__)) wcsupr(wchar_t *_Str);
func Xwcsupr(tls *TLS, __Str uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(procwcsupr.Addr(), __Str)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procwcsicoll = modcrt.NewProc(GoString(__ccgo_ts + 1967))

// int __attribute__((__cdecl__)) wcsicoll(const wchar_t *_Str1,const wchar_t *_Str2);
func Xwcsicoll(tls *TLS, __Str1 uintptr, __Str2 uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(procwcsicoll.Addr(), __Str1, __Str2)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

type Ttm = struct {
	Ftm_sec   int32
	Ftm_min   int32
	Ftm_hour  int32
	Ftm_mday  int32
	Ftm_mon   int32
	Ftm_year  int32
	Ftm_wday  int32
	Ftm_yday  int32
	Ftm_isdst int32
}

var proc_wasctime = modcrt.NewProc(GoString(__ccgo_ts + 1976))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _wasctime(const struct tm *_Tm);
func X_wasctime(tls *TLS, __Tm uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wasctime.Addr(), __Tm)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wasctime_s = modcrt.NewProc(GoString(__ccgo_ts + 1986))

// __attribute__((dllimport)) errno_t __attribute__((__cdecl__)) _wasctime_s (wchar_t *_Buf,size_t _SizeInWords,const struct tm *_Tm);
func X_wasctime_s(tls *TLS, __Buf uintptr, __SizeInWords Tsize_t, __Tm uintptr) (r Terrno_t) {
	r0, _, err := syscall.SyscallN(proc_wasctime_s.Addr(), __Buf, uintptr(__SizeInWords), __Tm)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Terrno_t(r0)
}

var proc_wctime32 = modcrt.NewProc(GoString(__ccgo_ts + 1998))

// wchar_t * __attribute__((__cdecl__)) _wctime32(const __time32_t *_Time);
func X_wctime32(tls *TLS, __Time uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wctime32.Addr(), __Time)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wctime32_s = modcrt.NewProc(GoString(__ccgo_ts + 2008))

// __attribute__((dllimport)) errno_t __attribute__((__cdecl__)) _wctime32_s (wchar_t *_Buf,size_t _SizeInWords,const __time32_t *_Time);
func X_wctime32_s(tls *TLS, __Buf uintptr, __SizeInWords Tsize_t, __Time uintptr) (r Terrno_t) {
	r0, _, err := syscall.SyscallN(proc_wctime32_s.Addr(), __Buf, uintptr(__SizeInWords), __Time)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Terrno_t(r0)
}

var procwcsftime = modcrt.NewProc(GoString(__ccgo_ts + 2020))

// size_t __attribute__((__cdecl__)) wcsftime(wchar_t * __restrict__ _Buf,size_t _SizeInWords,const wchar_t * __restrict__ _Format,const struct tm * __restrict__ _Tm);
func Xwcsftime(tls *TLS, __Buf uintptr, __SizeInWords Tsize_t, __Format uintptr, __Tm uintptr) (r Tsize_t) {
	r0, _, err := syscall.SyscallN(procwcsftime.Addr(), __Buf, uintptr(__SizeInWords), __Format, __Tm)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tsize_t(r0)
}

var proc_wcsftime_l = modcrt.NewProc(GoString(__ccgo_ts + 2029))

// __attribute__ ((__dllimport__)) size_t __attribute__((__cdecl__)) _wcsftime_l(wchar_t * __restrict__ _Buf,size_t _SizeInWords,const wchar_t * __restrict__ _Format,const struct tm * __restrict__ _Tm,_locale_t _Locale);
func X_wcsftime_l(tls *TLS, __Buf uintptr, __SizeInWords Tsize_t, __Format uintptr, __Tm uintptr, __Locale T_locale_t) (r Tsize_t) {
	r0, _, err := syscall.SyscallN(proc_wcsftime_l.Addr(), __Buf, uintptr(__SizeInWords), __Format, __Tm, __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tsize_t(r0)
}

var proc_wstrdate = modcrt.NewProc(GoString(__ccgo_ts + 2041))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _wstrdate(wchar_t *_Buffer);
func X_wstrdate(tls *TLS, __Buffer uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wstrdate.Addr(), __Buffer)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wstrdate_s = modcrt.NewProc(GoString(__ccgo_ts + 2051))

// __attribute__((dllimport)) errno_t __attribute__((__cdecl__)) _wstrdate_s (wchar_t *_Buf,size_t _SizeInWords);
func X_wstrdate_s(tls *TLS, __Buf uintptr, __SizeInWords Tsize_t) (r Terrno_t) {
	r0, _, err := syscall.SyscallN(proc_wstrdate_s.Addr(), __Buf, uintptr(__SizeInWords))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Terrno_t(r0)
}

var proc_wstrtime = modcrt.NewProc(GoString(__ccgo_ts + 2063))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _wstrtime(wchar_t *_Buffer);
func X_wstrtime(tls *TLS, __Buffer uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wstrtime.Addr(), __Buffer)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wstrtime_s = modcrt.NewProc(GoString(__ccgo_ts + 2073))

// __attribute__((dllimport)) errno_t __attribute__((__cdecl__)) _wstrtime_s (wchar_t *_Buf,size_t _SizeInWords);
func X_wstrtime_s(tls *TLS, __Buf uintptr, __SizeInWords Tsize_t) (r Terrno_t) {
	r0, _, err := syscall.SyscallN(proc_wstrtime_s.Addr(), __Buf, uintptr(__SizeInWords))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Terrno_t(r0)
}

var proc_wctime64 = modcrt.NewProc(GoString(__ccgo_ts + 2085))

// __attribute__ ((__dllimport__)) wchar_t * __attribute__((__cdecl__)) _wctime64(const __time64_t *_Time);
func X_wctime64(tls *TLS, __Time uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wctime64.Addr(), __Time)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wctime64_s = modcrt.NewProc(GoString(__ccgo_ts + 2095))

// __attribute__((dllimport)) errno_t __attribute__((__cdecl__)) _wctime64_s (wchar_t *_Buf,size_t _SizeInWords,const __time64_t *_Time);
func X_wctime64_s(tls *TLS, __Buf uintptr, __SizeInWords Tsize_t, __Time uintptr) (r Terrno_t) {
	r0, _, err := syscall.SyscallN(proc_wctime64_s.Addr(), __Buf, uintptr(__SizeInWords), __Time)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Terrno_t(r0)
}

var proc_wctime = modcrt.NewProc(GoString(__ccgo_ts + 2107))

// wchar_t * __attribute__((__cdecl__)) _wctime(const time_t *_Time);
func X_wctime(tls *TLS, __Time uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_wctime.Addr(), __Time)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_wctime_s = modcrt.NewProc(GoString(__ccgo_ts + 2115))

// errno_t __attribute__((__cdecl__)) _wctime_s(wchar_t *, size_t, const time_t *);
func X_wctime_s(tls *TLS, _0 uintptr, _1 Tsize_t, _2 uintptr) (r Terrno_t) {
	r0, _, err := syscall.SyscallN(proc_wctime_s.Addr(), _0, uintptr(_1), _2)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Terrno_t(r0)
}

type Tmbstate_t = int32

type T_Wint_t = uint16

var procbtowc = modcrt.NewProc(GoString(__ccgo_ts + 2125))

// wint_t __attribute__((__cdecl__)) btowc(int);
func Xbtowc(tls *TLS, _0 int32) (r Twint_t) {
	r0, _, err := syscall.SyscallN(procbtowc.Addr(), uintptr(_0))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Twint_t(r0)
}

var procmbrlen = modcrt.NewProc(GoString(__ccgo_ts + 2131))

// size_t __attribute__((__cdecl__)) mbrlen(const char * __restrict__ _Ch,size_t _SizeInBytes,mbstate_t * __restrict__ _State);
func Xmbrlen(tls *TLS, __Ch uintptr, __SizeInBytes Tsize_t, __State uintptr) (r Tsize_t) {
	r0, _, err := syscall.SyscallN(procmbrlen.Addr(), __Ch, uintptr(__SizeInBytes), __State)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tsize_t(r0)
}

var procmbrtowc = modcrt.NewProc(GoString(__ccgo_ts + 2138))

// size_t __attribute__((__cdecl__)) mbrtowc(wchar_t * __restrict__ _DstCh,const char * __restrict__ _SrcCh,size_t _SizeInBytes,mbstate_t * __restrict__ _State);
func Xmbrtowc(tls *TLS, __DstCh uintptr, __SrcCh uintptr, __SizeInBytes Tsize_t, __State uintptr) (r Tsize_t) {
	r0, _, err := syscall.SyscallN(procmbrtowc.Addr(), __DstCh, __SrcCh, uintptr(__SizeInBytes), __State)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tsize_t(r0)
}

var procmbsrtowcs = modcrt.NewProc(GoString(__ccgo_ts + 2146))

// size_t __attribute__((__cdecl__)) mbsrtowcs(wchar_t * __restrict__ _Dest,const char ** __restrict__ _PSrc,size_t _Count,mbstate_t * __restrict__ _State);
func Xmbsrtowcs(tls *TLS, __Dest uintptr, __PSrc uintptr, __Count Tsize_t, __State uintptr) (r Tsize_t) {
	r0, _, err := syscall.SyscallN(procmbsrtowcs.Addr(), __Dest, __PSrc, uintptr(__Count), __State)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tsize_t(r0)
}

var procwctob = modcrt.NewProc(GoString(__ccgo_ts + 2156))

// int __attribute__((__cdecl__)) wctob(wint_t _WCh);
func Xwctob(tls *TLS, __WCh Twint_t) (r int32) {
	r0, _, err := syscall.SyscallN(procwctob.Addr(), uintptr(__WCh))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var procwmemset = modcrt.NewProc(GoString(__ccgo_ts + 2162))

// wchar_t * __attribute__((__cdecl__)) wmemset(wchar_t *s, wchar_t c, size_t n);
func Xwmemset(tls *TLS, _s uintptr, _c Twchar_t, _n Tsize_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(procwmemset.Addr(), _s, uintptr(_c), uintptr(_n))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procwmemchr = modcrt.NewProc(GoString(__ccgo_ts + 2170))

// wchar_t * __attribute__((__cdecl__)) wmemchr(const wchar_t *s, wchar_t c, size_t n);
func Xwmemchr(tls *TLS, _s uintptr, _c Twchar_t, _n Tsize_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(procwmemchr.Addr(), _s, uintptr(_c), uintptr(_n))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procwmemcmp = modcrt.NewProc(GoString(__ccgo_ts + 2178))

// int __attribute__((__cdecl__)) wmemcmp(const wchar_t *s1, const wchar_t *s2,size_t n);
func Xwmemcmp(tls *TLS, _s1 uintptr, _s2 uintptr, _n Tsize_t) (r int32) {
	r0, _, err := syscall.SyscallN(procwmemcmp.Addr(), _s1, _s2, uintptr(_n))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var procwmemcpy = modcrt.NewProc(GoString(__ccgo_ts + 2186))

// wchar_t * __attribute__((__cdecl__)) wmemcpy(wchar_t * __restrict__ s1,const wchar_t * __restrict__ s2,size_t n);
func Xwmemcpy(tls *TLS, _s1 uintptr, _s2 uintptr, _n Tsize_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(procwmemcpy.Addr(), _s1, _s2, uintptr(_n))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procwmempcpy = modcrt.NewProc(GoString(__ccgo_ts + 2194))

// wchar_t * __attribute__((__cdecl__)) wmempcpy (wchar_t *_Dst, const wchar_t *_Src, size_t _Size);
func Xwmempcpy(tls *TLS, __Dst uintptr, __Src uintptr, __Size Tsize_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(procwmempcpy.Addr(), __Dst, __Src, uintptr(__Size))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procwmemmove = modcrt.NewProc(GoString(__ccgo_ts + 2203))

// wchar_t * __attribute__((__cdecl__)) wmemmove(wchar_t *s1, const wchar_t *s2, size_t n);
func Xwmemmove(tls *TLS, _s1 uintptr, _s2 uintptr, _n Tsize_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(procwmemmove.Addr(), _s1, _s2, uintptr(_n))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procfwide = modcrt.NewProc(GoString(__ccgo_ts + 2212))

// int __attribute__((__cdecl__)) fwide(FILE *stream,int mode);
func Xfwide(tls *TLS, _stream uintptr, _mode int32) (r int32) {
	r0, _, err := syscall.SyscallN(procfwide.Addr(), _stream, uintptr(_mode))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var procmbsinit = modcrt.NewProc(GoString(__ccgo_ts + 2218))

// int __attribute__((__cdecl__)) mbsinit(const mbstate_t *ps);
func Xmbsinit(tls *TLS, _ps uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(procmbsinit.Addr(), _ps)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var procwcstoll = modcrt.NewProc(GoString(__ccgo_ts + 2226))

// long long __attribute__((__cdecl__)) wcstoll(const wchar_t * __restrict__ nptr,wchar_t ** __restrict__ endptr, int base);
func Xwcstoll(tls *TLS, _nptr uintptr, _endptr uintptr, _base int32) (r int64) {
	r0, _, err := syscall.SyscallN(procwcstoll.Addr(), _nptr, _endptr, uintptr(_base))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int64(r0)
}

var procwcstoull = modcrt.NewProc(GoString(__ccgo_ts + 2234))

// unsigned long long __attribute__((__cdecl__)) wcstoull(const wchar_t * __restrict__ nptr,wchar_t ** __restrict__ endptr, int base);
func Xwcstoull(tls *TLS, _nptr uintptr, _endptr uintptr, _base int32) (r uint64) {
	r0, _, err := syscall.SyscallN(procwcstoull.Addr(), _nptr, _endptr, uintptr(_base))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uint64(r0)
}

var proc__mingw_str_wide_utf8 = modcrt.NewProc(GoString(__ccgo_ts + 2243))

// int __attribute__((__cdecl__)) __mingw_str_wide_utf8 (const wchar_t * const wptr, char **mbptr, size_t * buflen);
func X__mingw_str_wide_utf8(tls *TLS, _wptr uintptr, _mbptr uintptr, _buflen uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc__mingw_str_wide_utf8.Addr(), _wptr, _mbptr, _buflen)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc__mingw_str_utf8_wide = modcrt.NewProc(GoString(__ccgo_ts + 2265))

// int __attribute__((__cdecl__)) __mingw_str_utf8_wide (const char *const mbptr, wchar_t ** wptr, size_t * buflen);
func X__mingw_str_utf8_wide(tls *TLS, _mbptr uintptr, _wptr uintptr, _buflen uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc__mingw_str_utf8_wide.Addr(), _mbptr, _wptr, _buflen)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc__mingw_str_free = modcrt.NewProc(GoString(__ccgo_ts + 2287))

// void __attribute__((__cdecl__)) __mingw_str_free(void *ptr);
func X__mingw_str_free(tls *TLS, _ptr uintptr) {
	_, _, err := syscall.SyscallN(proc__mingw_str_free.Addr(), _ptr)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
}

var proc_memccpy = modcrt.NewProc(GoString(__ccgo_ts + 2304))

// __attribute__ ((__dllimport__)) void * __attribute__((__cdecl__)) _memccpy(void *_Dst,const void *_Src,int _Val,size_t _MaxCount);
func X_memccpy(tls *TLS, __Dst uintptr, __Src uintptr, __Val int32, __MaxCount Tsize_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_memccpy.Addr(), __Dst, __Src, uintptr(__Val), uintptr(__MaxCount))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_memicmp = modcrt.NewProc(GoString(__ccgo_ts + 2313))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _memicmp(const void *_Buf1,const void *_Buf2,size_t _Size);
func X_memicmp(tls *TLS, __Buf1 uintptr, __Buf2 uintptr, __Size Tsize_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_memicmp.Addr(), __Buf1, __Buf2, uintptr(__Size))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_memicmp_l = modcrt.NewProc(GoString(__ccgo_ts + 2322))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _memicmp_l(const void *_Buf1,const void *_Buf2,size_t _Size,_locale_t _Locale);
func X_memicmp_l(tls *TLS, __Buf1 uintptr, __Buf2 uintptr, __Size Tsize_t, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_memicmp_l.Addr(), __Buf1, __Buf2, uintptr(__Size), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var procmemcpy_s = modcrt.NewProc(GoString(__ccgo_ts + 2333))

// __attribute__((dllimport)) errno_t __attribute__((__cdecl__)) memcpy_s (void *_dest,size_t _numberOfElements,const void *_src,size_t _count);
func Xmemcpy_s(tls *TLS, __dest uintptr, __numberOfElements Tsize_t, __src uintptr, __count Tsize_t) (r Terrno_t) {
	r0, _, err := syscall.SyscallN(procmemcpy_s.Addr(), __dest, uintptr(__numberOfElements), __src, uintptr(__count))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Terrno_t(r0)
}

var procmempcpy = modcrt.NewProc(GoString(__ccgo_ts + 2342))

// void * __attribute__((__cdecl__)) mempcpy (void *_Dst, const void *_Src, size_t _Size);
func Xmempcpy(tls *TLS, __Dst uintptr, __Src uintptr, __Size Tsize_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(procmempcpy.Addr(), __Dst, __Src, uintptr(__Size))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procmemccpy = modcrt.NewProc(GoString(__ccgo_ts + 2350))

// void * __attribute__((__cdecl__)) memccpy(void *_Dst,const void *_Src,int _Val,size_t _Size);
func Xmemccpy(tls *TLS, __Dst uintptr, __Src uintptr, __Val int32, __Size Tsize_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(procmemccpy.Addr(), __Dst, __Src, uintptr(__Val), uintptr(__Size))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procmemicmp = modcrt.NewProc(GoString(__ccgo_ts + 2358))

// int __attribute__((__cdecl__)) memicmp(const void *_Buf1,const void *_Buf2,size_t _Size);
func Xmemicmp(tls *TLS, __Buf1 uintptr, __Buf2 uintptr, __Size Tsize_t) (r int32) {
	r0, _, err := syscall.SyscallN(procmemicmp.Addr(), __Buf1, __Buf2, uintptr(__Size))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_strset = modcrt.NewProc(GoString(__ccgo_ts + 2366))

// char * __attribute__((__cdecl__)) _strset(char *_Str,int _Val);
func X_strset(tls *TLS, __Str uintptr, __Val int32) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_strset.Addr(), __Str, uintptr(__Val))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_strset_l = modcrt.NewProc(GoString(__ccgo_ts + 2374))

// char * __attribute__((__cdecl__)) _strset_l(char *_Str,int _Val,_locale_t _Locale);
func X_strset_l(tls *TLS, __Str uintptr, __Val int32, __Locale T_locale_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_strset_l.Addr(), __Str, uintptr(__Val), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procstrnlen = modcrt.NewProc(GoString(__ccgo_ts + 2384))

// size_t __attribute__((__cdecl__)) strnlen(const char *_Str,size_t _MaxCount);
func Xstrnlen(tls *TLS, __Str uintptr, __MaxCount Tsize_t) (r Tsize_t) {
	r0, _, err := syscall.SyscallN(procstrnlen.Addr(), __Str, uintptr(__MaxCount))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tsize_t(r0)
}

var proc_strcmpi = modcrt.NewProc(GoString(__ccgo_ts + 2392))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _strcmpi(const char *_Str1,const char *_Str2);
func X_strcmpi(tls *TLS, __Str1 uintptr, __Str2 uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_strcmpi.Addr(), __Str1, __Str2)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_stricmp_l = modcrt.NewProc(GoString(__ccgo_ts + 2401))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _stricmp_l(const char *_Str1,const char *_Str2,_locale_t _Locale);
func X_stricmp_l(tls *TLS, __Str1 uintptr, __Str2 uintptr, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_stricmp_l.Addr(), __Str1, __Str2, __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var procstrcoll = modcrt.NewProc(GoString(__ccgo_ts + 2412))

// int __attribute__((__cdecl__)) strcoll(const char *_Str1,const char *_Str2);
func Xstrcoll(tls *TLS, __Str1 uintptr, __Str2 uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(procstrcoll.Addr(), __Str1, __Str2)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_strcoll_l = modcrt.NewProc(GoString(__ccgo_ts + 2420))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _strcoll_l(const char *_Str1,const char *_Str2,_locale_t _Locale);
func X_strcoll_l(tls *TLS, __Str1 uintptr, __Str2 uintptr, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_strcoll_l.Addr(), __Str1, __Str2, __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_stricoll = modcrt.NewProc(GoString(__ccgo_ts + 2431))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _stricoll(const char *_Str1,const char *_Str2);
func X_stricoll(tls *TLS, __Str1 uintptr, __Str2 uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(proc_stricoll.Addr(), __Str1, __Str2)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_stricoll_l = modcrt.NewProc(GoString(__ccgo_ts + 2441))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _stricoll_l(const char *_Str1,const char *_Str2,_locale_t _Locale);
func X_stricoll_l(tls *TLS, __Str1 uintptr, __Str2 uintptr, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_stricoll_l.Addr(), __Str1, __Str2, __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_strncoll = modcrt.NewProc(GoString(__ccgo_ts + 2453))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _strncoll (const char *_Str1,const char *_Str2,size_t _MaxCount);
func X_strncoll(tls *TLS, __Str1 uintptr, __Str2 uintptr, __MaxCount Tsize_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_strncoll.Addr(), __Str1, __Str2, uintptr(__MaxCount))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_strncoll_l = modcrt.NewProc(GoString(__ccgo_ts + 2463))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _strncoll_l(const char *_Str1,const char *_Str2,size_t _MaxCount,_locale_t _Locale);
func X_strncoll_l(tls *TLS, __Str1 uintptr, __Str2 uintptr, __MaxCount Tsize_t, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_strncoll_l.Addr(), __Str1, __Str2, uintptr(__MaxCount), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_strnicoll = modcrt.NewProc(GoString(__ccgo_ts + 2475))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _strnicoll (const char *_Str1,const char *_Str2,size_t _MaxCount);
func X_strnicoll(tls *TLS, __Str1 uintptr, __Str2 uintptr, __MaxCount Tsize_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_strnicoll.Addr(), __Str1, __Str2, uintptr(__MaxCount))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_strnicoll_l = modcrt.NewProc(GoString(__ccgo_ts + 2486))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _strnicoll_l(const char *_Str1,const char *_Str2,size_t _MaxCount,_locale_t _Locale);
func X_strnicoll_l(tls *TLS, __Str1 uintptr, __Str2 uintptr, __MaxCount Tsize_t, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_strnicoll_l.Addr(), __Str1, __Str2, uintptr(__MaxCount), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_strerror = modcrt.NewProc(GoString(__ccgo_ts + 2499))

// __attribute__ ((__dllimport__)) char * __attribute__((__cdecl__)) _strerror(const char *_ErrMsg);
func X_strerror(tls *TLS, __ErrMsg uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_strerror.Addr(), __ErrMsg)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_strlwr = modcrt.NewProc(GoString(__ccgo_ts + 2509))

// __attribute__ ((__dllimport__)) char * __attribute__((__cdecl__)) _strlwr(char *_String);
func X_strlwr(tls *TLS, __String uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_strlwr.Addr(), __String)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procstrlwr_l = modcrt.NewProc(GoString(__ccgo_ts + 2517))

// char *strlwr_l(char *_String,_locale_t _Locale);
func Xstrlwr_l(tls *TLS, __String uintptr, __Locale T_locale_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(procstrlwr_l.Addr(), __String, __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procstrncat = modcrt.NewProc(GoString(__ccgo_ts + 2526))

// char * __attribute__((__cdecl__)) strncat(char * __restrict__ _Dest,const char * __restrict__ _Source,size_t _Count);
func Xstrncat(tls *TLS, __Dest uintptr, __Source uintptr, __Count Tsize_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(procstrncat.Addr(), __Dest, __Source, uintptr(__Count))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_strnicmp_l = modcrt.NewProc(GoString(__ccgo_ts + 2534))

// __attribute__ ((__dllimport__)) int __attribute__((__cdecl__)) _strnicmp_l(const char *_Str1,const char *_Str2,size_t _MaxCount,_locale_t _Locale);
func X_strnicmp_l(tls *TLS, __Str1 uintptr, __Str2 uintptr, __MaxCount Tsize_t, __Locale T_locale_t) (r int32) {
	r0, _, err := syscall.SyscallN(proc_strnicmp_l.Addr(), __Str1, __Str2, uintptr(__MaxCount), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var proc_strnset = modcrt.NewProc(GoString(__ccgo_ts + 2546))

// __attribute__ ((__dllimport__)) char * __attribute__((__cdecl__)) _strnset(char *_Str,int _Val,size_t _MaxCount);
func X_strnset(tls *TLS, __Str uintptr, __Val int32, __MaxCount Tsize_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_strnset.Addr(), __Str, uintptr(__Val), uintptr(__MaxCount))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_strnset_l = modcrt.NewProc(GoString(__ccgo_ts + 2555))

// __attribute__ ((__dllimport__)) char * __attribute__((__cdecl__)) _strnset_l(char *str,int c,size_t count,_locale_t _Locale);
func X_strnset_l(tls *TLS, _str uintptr, _c int32, _count Tsize_t, __Locale T_locale_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_strnset_l.Addr(), _str, uintptr(_c), uintptr(_count), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_strrev = modcrt.NewProc(GoString(__ccgo_ts + 2566))

// __attribute__ ((__dllimport__)) char * __attribute__((__cdecl__)) _strrev(char *_Str);
func X_strrev(tls *TLS, __Str uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_strrev.Addr(), __Str)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procstrtok = modcrt.NewProc(GoString(__ccgo_ts + 2574))

// char * __attribute__((__cdecl__)) strtok(char * __restrict__ _Str,const char * __restrict__ _Delim);
func Xstrtok(tls *TLS, __Str uintptr, __Delim uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(procstrtok.Addr(), __Str, __Delim)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procstrtok_r = modcrt.NewProc(GoString(__ccgo_ts + 2581))

// char *strtok_r(char * __restrict__ _Str, const char * __restrict__ _Delim, char ** __restrict__ __last);
func Xstrtok_r(tls *TLS, __Str uintptr, __Delim uintptr, ___last uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(procstrtok_r.Addr(), __Str, __Delim, ___last)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_strupr = modcrt.NewProc(GoString(__ccgo_ts + 2590))

// __attribute__ ((__dllimport__)) char * __attribute__((__cdecl__)) _strupr(char *_String);
func X_strupr(tls *TLS, __String uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_strupr.Addr(), __String)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var proc_strupr_l = modcrt.NewProc(GoString(__ccgo_ts + 2598))

// __attribute__ ((__dllimport__)) char *_strupr_l(char *_String,_locale_t _Locale);
func X_strupr_l(tls *TLS, __String uintptr, __Locale T_locale_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(proc_strupr_l.Addr(), __String, __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procstrxfrm = modcrt.NewProc(GoString(__ccgo_ts + 2608))

// size_t __attribute__((__cdecl__)) strxfrm(char * __restrict__ _Dst,const char * __restrict__ _Src,size_t _MaxCount);
func Xstrxfrm(tls *TLS, __Dst uintptr, __Src uintptr, __MaxCount Tsize_t) (r Tsize_t) {
	r0, _, err := syscall.SyscallN(procstrxfrm.Addr(), __Dst, __Src, uintptr(__MaxCount))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tsize_t(r0)
}

var proc_strxfrm_l = modcrt.NewProc(GoString(__ccgo_ts + 2616))

// __attribute__ ((__dllimport__)) size_t __attribute__((__cdecl__)) _strxfrm_l(char * __restrict__ _Dst,const char * __restrict__ _Src,size_t _MaxCount,_locale_t _Locale);
func X_strxfrm_l(tls *TLS, __Dst uintptr, __Src uintptr, __MaxCount Tsize_t, __Locale T_locale_t) (r Tsize_t) {
	r0, _, err := syscall.SyscallN(proc_strxfrm_l.Addr(), __Dst, __Src, uintptr(__MaxCount), __Locale)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return Tsize_t(r0)
}

var procstrcmpi = modcrt.NewProc(GoString(__ccgo_ts + 2627))

// int __attribute__((__cdecl__)) strcmpi(const char *_Str1,const char *_Str2);
func Xstrcmpi(tls *TLS, __Str1 uintptr, __Str2 uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(procstrcmpi.Addr(), __Str1, __Str2)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var procstricmp = modcrt.NewProc(GoString(__ccgo_ts + 2635))

// int __attribute__((__cdecl__)) stricmp(const char *_Str1,const char *_Str2);
func Xstricmp(tls *TLS, __Str1 uintptr, __Str2 uintptr) (r int32) {
	r0, _, err := syscall.SyscallN(procstricmp.Addr(), __Str1, __Str2)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var procstrlwr = modcrt.NewProc(GoString(__ccgo_ts + 2643))

// char * __attribute__((__cdecl__)) strlwr(char *_Str);
func Xstrlwr(tls *TLS, __Str uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(procstrlwr.Addr(), __Str)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procstrnicmp = modcrt.NewProc(GoString(__ccgo_ts + 2650))

// int __attribute__((__cdecl__)) strnicmp(const char *_Str1,const char *_Str,size_t _MaxCount);
func Xstrnicmp(tls *TLS, __Str1 uintptr, __Str uintptr, __MaxCount Tsize_t) (r int32) {
	r0, _, err := syscall.SyscallN(procstrnicmp.Addr(), __Str1, __Str, uintptr(__MaxCount))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var procstrncasecmp = modcrt.NewProc(GoString(__ccgo_ts + 2659))

// int __attribute__((__cdecl__)) strncasecmp (const char *, const char *, size_t);
func Xstrncasecmp(tls *TLS, _0 uintptr, _1 uintptr, _2 Tsize_t) (r int32) {
	r0, _, err := syscall.SyscallN(procstrncasecmp.Addr(), _0, _1, uintptr(_2))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return int32(r0)
}

var procstrnset = modcrt.NewProc(GoString(__ccgo_ts + 2671))

// char * __attribute__((__cdecl__)) strnset(char *_Str,int _Val,size_t _MaxCount);
func Xstrnset(tls *TLS, __Str uintptr, __Val int32, __MaxCount Tsize_t) (r uintptr) {
	r0, _, err := syscall.SyscallN(procstrnset.Addr(), __Str, uintptr(__Val), uintptr(__MaxCount))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procstrrev = modcrt.NewProc(GoString(__ccgo_ts + 2679))

// char * __attribute__((__cdecl__)) strrev(char *_Str);
func Xstrrev(tls *TLS, __Str uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(procstrrev.Addr(), __Str)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procstrset = modcrt.NewProc(GoString(__ccgo_ts + 2686))

// char * __attribute__((__cdecl__)) strset(char *_Str,int _Val);
func Xstrset(tls *TLS, __Str uintptr, __Val int32) (r uintptr) {
	r0, _, err := syscall.SyscallN(procstrset.Addr(), __Str, uintptr(__Val))
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var procstrupr = modcrt.NewProc(GoString(__ccgo_ts + 2693))

// char * __attribute__((__cdecl__)) strupr(char *_Str);
func Xstrupr(tls *TLS, __Str uintptr) (r uintptr) {
	r0, _, err := syscall.SyscallN(procstrupr.Addr(), __Str)
	if err != 0 {
		*(*int32)(unsafe.Pointer(X__errno_location(tls))) = int32(err)
	}
	return uintptr(r0)
}

var __ccgo_ts = (*reflect.StringHeader)(unsafe.Pointer(&__ccgo_ts1)).Data

var __ccgo_ts1 = "__iob_func\x00iswalpha\x00_iswalpha_l\x00iswupper\x00_iswupper_l\x00iswlower\x00_iswlower_l\x00iswdigit\x00_iswdigit_l\x00iswxdigit\x00_iswxdigit_l\x00iswspace\x00_iswspace_l\x00iswpunct\x00_iswpunct_l\x00iswalnum\x00_iswalnum_l\x00iswprint\x00_iswprint_l\x00iswgraph\x00_iswgraph_l\x00iswcntrl\x00_iswcntrl_l\x00iswascii\x00isleadbyte\x00_isleadbyte_l\x00towupper\x00_towupper_l\x00towlower\x00_towlower_l\x00iswctype\x00is_wctype\x00iswblank\x00_wgetcwd\x00_wgetdcwd\x00_wchdir\x00_wmkdir\x00_wrmdir\x00_waccess\x00_wchmod\x00_wcreat\x00_wfindfirst32\x00_wfindnext32\x00_wrename\x00_wmktemp\x00_wfindfirst32i64\x00_wfindfirst64i32\x00_wfindfirst64\x00_wfindnext32i64\x00_wfindnext64i32\x00_wfindnext64\x00_wsopen_s\x00_wsetlocale\x00_wexecv\x00_wexecve\x00_wexecvp\x00_wexecvpe\x00_wspawnv\x00_wspawnve\x00_wspawnvp\x00_wspawnvpe\x00_wsystem\x00_wstat32\x00_wstat32i64\x00_wstat64i32\x00_wstat64\x00_cgetws\x00_getwch\x00_getwche\x00_putwch\x00_ungetwch\x00_cputws\x00_vcwprintf\x00_vcwprintf_p\x00_vcwprintf_l\x00_vcwprintf_p_l\x00__mingw_vwscanf\x00__mingw_vwprintf\x00__mingw_vswprintf\x00__ms_vfwprintf\x00__ms_vwprintf\x00__ms_vswprintf\x00_wfsopen\x00fgetwc\x00_fgetwchar\x00fputwc\x00_fputwchar\x00getwc\x00getwchar\x00putwc\x00putwchar\x00ungetwc\x00fgetws\x00fputws\x00_getws\x00_putws\x00_vswprintf_c\x00_vfwprintf_p\x00_vwprintf_p\x00_vswprintf_p\x00_vscwprintf_p\x00_vwprintf_l\x00_vwprintf_p_l\x00_vfwprintf_l\x00_vfwprintf_p_l\x00_vswprintf_c_l\x00_vswprintf_p_l\x00_vscwprintf_p_l\x00_vsnwprintf_l\x00_vswprintf\x00_vswprintf_l\x00__vswprintf_l\x00_wtempnam\x00_vscwprintf\x00_vscwprintf_l\x00_wfdopen\x00_wfopen\x00_wfreopen\x00_wperror\x00_wpopen\x00_wremove\x00_wtmpnam\x00_itow\x00_ltow\x00_ultow\x00_wcstod_l\x00__mingw_wcstod\x00__mingw_wcstof\x00__mingw_wcstold\x00wcstold\x00wcstol\x00_wcstol_l\x00wcstoul\x00_wcstoul_l\x00_wtof\x00_wtof_l\x00_wtoi_l\x00_wtol\x00_wtol_l\x00_i64tow\x00_ui64tow\x00_wtoi64\x00_wtoi64_l\x00_wcstoi64\x00_wcstoi64_l\x00_wcstoui64\x00_wcstoui64_l\x00_wfullpath\x00_wmakepath\x00_wsearchenv\x00_wsplitpath\x00_wcsdup\x00wcscat\x00wcscspn\x00wcsnlen\x00wcsncat\x00wcsncpy\x00_wcsncpy_l\x00wcspbrk\x00wcsrchr\x00wcsspn\x00wcsstr\x00wcstok\x00_wcserror\x00__wcserror\x00_wcsicmp_l\x00_wcsnicmp_l\x00_wcsnset\x00_wcsrev\x00_wcsset\x00_wcslwr\x00_wcslwr_l\x00_wcsupr\x00_wcsupr_l\x00wcsxfrm\x00_wcsxfrm_l\x00wcscoll\x00_wcscoll_l\x00_wcsicoll\x00_wcsicoll_l\x00_wcsncoll\x00_wcsncoll_l\x00_wcsnicoll\x00_wcsnicoll_l\x00wcsdup\x00wcsnicmp\x00wcsnset\x00wcsrev\x00wcsset\x00wcslwr\x00wcsupr\x00wcsicoll\x00_wasctime\x00_wasctime_s\x00_wctime32\x00_wctime32_s\x00wcsftime\x00_wcsftime_l\x00_wstrdate\x00_wstrdate_s\x00_wstrtime\x00_wstrtime_s\x00_wctime64\x00_wctime64_s\x00_wctime\x00_wctime_s\x00btowc\x00mbrlen\x00mbrtowc\x00mbsrtowcs\x00wctob\x00wmemset\x00wmemchr\x00wmemcmp\x00wmemcpy\x00wmempcpy\x00wmemmove\x00fwide\x00mbsinit\x00wcstoll\x00wcstoull\x00__mingw_str_wide_utf8\x00__mingw_str_utf8_wide\x00__mingw_str_free\x00_memccpy\x00_memicmp\x00_memicmp_l\x00memcpy_s\x00mempcpy\x00memccpy\x00memicmp\x00_strset\x00_strset_l\x00strnlen\x00_strcmpi\x00_stricmp_l\x00strcoll\x00_strcoll_l\x00_stricoll\x00_stricoll_l\x00_strncoll\x00_strncoll_l\x00_strnicoll\x00_strnicoll_l\x00_strerror\x00_strlwr\x00strlwr_l\x00strncat\x00_strnicmp_l\x00_strnset\x00_strnset_l\x00_strrev\x00strtok\x00strtok_r\x00_strupr\x00_strupr_l\x00strxfrm\x00_strxfrm_l\x00strcmpi\x00stricmp\x00strlwr\x00strnicmp\x00strncasecmp\x00strnset\x00strrev\x00strset\x00strupr\x00"
