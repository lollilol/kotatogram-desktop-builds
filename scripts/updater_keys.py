# -*- coding: utf-8 -*-
import os
p = os.environ["REPO_NAME"]+"/../DesktopPrivate"
os.mkdir(p)
os.chdir(p)

keys_contents = r"""
const char *PrivateKey = "\
-----BEGIN RSA PRIVATE KEY-----\n\
""" + os.environ["PACKER_PRIVATE_KEY"] + r"""
-----END RSA PRIVATE KEY-----\
";

const char *PrivateBetaKey = "\
-----BEGIN RSA PRIVATE KEY-----\n\
""" + os.environ["PACKER_PRIVATE_BETA_KEY"] + r"""
-----END RSA PRIVATE KEY-----\
";
"""

alpha_contents = r"""
const char *AlphaPrivateKey = "";
"""

with open("packer_private.h", "w", encoding="utf-8") as f:
    f.write(keys_contents)

with open("alpha_private.h", "w", encoding="utf-8") as f:
    f.write(alpha_contents)
