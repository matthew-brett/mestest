# Platform detection
is_windows = host_machine.system() == 'windows'

# Manual add of MS_WIN64 macro when not using MSVC.
# https://bugs.python.org/issue28267
if is_windows and meson.get_compiler('c').get_id() == 'gcc'
  add_global_arguments('-DMS_WIN64', language: ['c', 'cpp', 'fortran'])
endif

# NumPy include directory - needed in all submodules
incdir_numpy = run_command(py3,
  [
    '-c',
    'import os; os.chdir(".."); import numpy; print(numpy.get_include())'
  ],
  check: true
).stdout().strip()

inc_np = include_directories(incdir_numpy)

npymath_path = incdir_numpy / '..' / 'lib'
npymath_lib = meson.get_compiler('c').find_library('npymath', dirs: npymath_path)
npyrandom_path = incdir_numpy / '..' / '..' / 'random' / 'lib'
npyrandom_lib = meson.get_compiler('c').find_library('npyrandom', dirs: npyrandom_path)

# Don't use the deprecated NumPy C API. Define this to a fixed version instead of
# NPY_API_VERSION in order not to break compilation for released SciPy versions
# when NumPy introduces a new deprecation. Use in a meson.build file::
#
#   py3.extension_module('_name',
#     'source_fname',
#     numpy_nodepr_api)
#
numpy_nodepr_api = '-DNPY_NO_DEPRECATED_API=NPY_1_9_API_VERSION'

biasedurn = py3.extension_module('biasedurn',
  [
    'biasedurn.cpp',
    'biasedurn/fnchyppr.cpp',
    'biasedurn/impls.cpp',
    'biasedurn/stoc1.cpp',
    'biasedurn/stoc3.cpp',
    'biasedurn/stocR.h',
    'biasedurn/wnchyppr.cpp',
  ],
  cpp_args: ['-DR_BUILD', numpy_nodepr_api],
  include_directories: [inc_np],
  dependencies: [py3_dep, npyrandom_lib, npymath_lib],
  override_options: ['cython_language=cpp'],
  install: true,
  subdir: 'sptats'
)
