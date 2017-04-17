## Keypair
resource "aws_key_pair" "gpg_auth" {
  key_name   = "GPGAuthKey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC+Q0bmuBWN8c4929QO+MkGgJcuGhkNVNSiyl4gMDSxI097nqa79VMk/l6YBVngBCxKFfv49nepDJLm1LwBs6uZZAyoEUa8VwfpqPXRyc5XlhyMIXgHINNIgwawglxjqSMc3HRTzShFvUdlyXjrnapjRxfNOM8J5JznwaLa/gyhUuo5jRvoi7LFyzBmbgWmE6B5pIMvZj0DTEsfQl+LYoRaRblTC1K4ZlMec1Fui3iRVdE77aTx4DhjdaqoxJ9UHrovDRuRNzhkYuFaHuiDHTUYfgY3y9koFv9ALdzXVbDzp75OlzZs3bGIQP7R6UnBGPb/zpG8RqE5FYxL17ztp4oLcczQoR5OO1BemIso7D5LH7I7CQ0moeikI4GgQENqERGTwWwcs5vjRHElPJiCP8BXPn0wr7mz8OZYJGipWhU+xptxpY8etDfhk125MK8moBm632H0PVC5zoRTsuL4KX9pAXmly9AI0Rv41KmxrGUK4MS6heEM93C610Zd4oYcMRcjQ7M5t0tSawgTc0PYKUqipe+by/OpJMT0dayWdOqYG9zD9ZUZemh0sZuPHzNo2cevb1fLbHcZQFjh3y62bOQtInChYqlaFYkVYB2RztHwREdwaWdUeCjISnpQ7CCeA6b2QCknpJA5IN20rM7356+VCL68ivulPUfcKW+uNtuJxw== dstrong@glyx.co.uk"
}
