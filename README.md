# If ... Else If ...

## Description
An advanced lookup table with multiple tests and returns.
Easiest way to create custom conditions without knowledges in Javascript.
Can help your clients to be autonomous in Google Tag Manager.

## Example

### Page template
| If | Matches | This | Return |
| ---- | ---- | ---- | ---- |
|{{Page Path}}|equals|/|home page|
|{{Body ID}}|starts with|product-cat-|products list page|
|{{Body Classes}}|contains|product-id-|product page|
|{{Body ID}}|contains|product-|product page|
|{{DL_formName}}|matches RegExp|(testdrive\|quotation)|form lead page|
