import os
import time
import pandas as pd
import numpy as np
from datetime import datetime
import scipy.stats as stats
from tqdm import tqdm
import logging
import torch

import importlib.metadata
import sys

def get_top_level_packages():
    return {dist.metadata['Name']: dist.version for dist in importlib.metadata.distributions()}

def main():
    # Specify the top-level packages you're interested in, including scipy and tqdm now.
    libraries_to_check = ['torch', 'numpy', 'pandas', 'scipy', 'tqdm']  # Added scipy and tqdm
    
    top_level_packages = get_top_level_packages()
    
    print("Specified libraries and their version numbers:")
    for lib in libraries_to_check:
        version = top_level_packages.get(lib)
        if version:
            print(f"{lib}: {version}")
        else:
            print(f"{lib}: Version info not found or library not recognized as an installed package")

if __name__ == "__main__":
    main()