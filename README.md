# Homebrew Fast Resize

Official Homebrew tap for [FastResize](https://github.com/tranhuucanh/fast_resize) - a fast, lightweight image resizing library.

## Installation

```bash
brew tap tranhuucanh/fast_resize
brew install fast_resize
```

## What is FastResize?

FastResize is a high-performance image resizing library with C++ backend supporting PNG, JPG, JPEG, WEBP, and BMP formats. It features parallel batch processing and minimal memory footprint.

### Features

- ⚡ **Fast**: Optimized with SIMD (SSE2, AVX, NEON) for maximum performance
- 🪶 **Lightweight**: Minimal dependencies, static linking
- 🔄 **Batch Processing**: Process hundreds of images in parallel
- 🎨 **Multiple Formats**: PNG, JPG, JPEG, WEBP, BMP
- 🔧 **Easy to Use**: Simple C++ and Ruby APIs

## Usage

### As a Library (C++)

```cpp
#include <fastresize.h>

// Resize an image
fastresize::ResizeOptions opts;
opts.target_width = 800;
opts.target_height = 600;
fastresize::resize("input.jpg", "output.jpg", opts);
```

### As a Ruby Gem

FastResize is also available as a Ruby gem:

```bash
gem install fast_resize
```

```ruby
require 'fastresize'

# Resize an image
FastResize.resize("input.jpg", "output.jpg", width: 800, height: 600)

# Batch resize
files = ["img1.jpg", "img2.jpg", "img3.jpg"]
FastResize.batch_resize(files, "output_dir/", width: 800, height: 600)
```

## Documentation

For full documentation, visit: https://github.com/tranhuucanh/fast_resize

## Issues

Report issues at: https://github.com/tranhuucanh/fast_resize/issues

## License

FastResize is licensed under the [BSD-3-Clause License](https://github.com/tranhuucanh/fast_resize/blob/main/LICENSE).
