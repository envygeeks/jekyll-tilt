# Jekyll Tilt

Jekyll Tilt is a template ***preprocessor*** for Jekyll.

## How is it different?

The major difference between other processors and Jekyll Tilt is that we do not trust, or rely on Jekyll to do the bulk of our work. And we do the bulk of our work before Jekyll does it's work.  That means we process your templates *before* Jekyll does it's processing, and then after we process, we replace the content that Jekyll expects to be content.  This allows us to not only maintain a small code base, but to prevent common errors with other templating systems that integrate tightly with Jekyll.

## Supported Engines

| Extension | Engine | Layouts | Pages | Default |
| --------- | ------ | ------- | ----- | ------- |
| .haml     | Haml   | ✔       | ✔    | ✔       |
| .erb      | ERB    | ✔       | ✔    | ✔       |
| .erubis   | Erubis | ✔       | ✔    | ✗       |
| .sigil    | Sigil  | ✔       | ✔    | ✗       |
