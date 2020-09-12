# -*- coding: utf-8 -*-
# pylint: disable=missing-docstring,unused-import,reimported
import io
import pytest  # type: ignore

import odata_url_parser.cli as cli
import odata_url_parser.odata_url_parser as oup


def test_main_ok_minimal(capsys):
    job = ['does not matter']
    report_expected = ''
    assert cli.main(job) is None
    out, err = capsys.readouterr()
    assert out.strip() == report_expected.strip()
