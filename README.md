# If Else If - Advanced Lookup Table

## Description
An advanced lookup table with multiple tests and returns.
Easiest way to create custom conditions without knowledges in Javascript.
Can help your clients to be autonomous in Google Tag Manager.

## How to install
1. Open a Google Tag Manager container and go to the **Templates** menu.
2. In the **Variables Templates** section, click on **Search Gallery** button.
3. In the opened side panel, click on the **Search Icon** then type *"**sublimetrix**"*
4. Select the variable you want then click **Add to workspace** and publish your workspace.

*Do not forget to visit the **Templates** section sometimes to update gallery templates if a rounded blue arrow is visible.*

## Example

### Page template
| If | Matches | This | Return |
| ---- | ---- | ---- | ---- |
|{{Page Path}}|equals|/|home page|
|{{Body ID}}|starts with|product-cat-|products list page|
|{{Body Classes}}|contains|product-id-|product page|
|{{Body ID}}|contains|product-|product page|
|{{DL_formName}}|matches RegExp|(testdrive\|quotation)|form lead page|
