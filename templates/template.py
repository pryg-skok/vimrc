#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Copyright (c) 2012-2015 TightVideo Ltd.

import argparse
import logging


log = logging.getLogger(__name__)


def setup_logger(stdout=True, level=logging.INFO):
    log.setLevel(level)
    if stdout:
        msgfmt = u"[%(levelname)s] %(message)s"
        handler = logging.StreamHandler()
    else:  # syslog handler
        msgfmt = u"%(module)s %(asctime)s [%(levelname)s] %(message)s"
        handler = logging.handlers.SysLogHandler("/dev/log")
    datefmt = "%Y-%m-%d %I:%M:%S"
    formatter = logging.Formatter(msgfmt, datefmt)
    handler.setFormatter(formatter)
    handler.setLevel(level)
    log.addHandler(handler)
    return log


def init():
    parser = argparse.ArgumentParser()
    parser.add_argument("--debug", "-d", action="store_true", help="Turn on debug mode")
    args = parser.parse_args()
    setup_logger()
    return args


def main():
    args = init()
    log.info("Hello new app")


if __name__ == "__main__":
    main()
