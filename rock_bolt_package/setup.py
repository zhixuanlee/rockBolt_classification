from distutils.core import setup
from Cython.Build import cythonize

setup(ext_modules=cythonize('raw_data_process_c.pyx'))
