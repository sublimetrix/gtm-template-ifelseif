___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "displayName": "If ... Else If ...",
  "description": "An advanced lookup table with multiple tests and returns (by Sublimetrix)",
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "MACRO",
  "version": 1,
  "containerContexts": [
    "WEB"
  ],
  "brand": {
    "displayName": "Custom Template"
  }
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "LABEL",
    "name": "documentation",
    "displayName": "Documentation : https://github.com/sublimetrix/gtm-template-ifelseif"
  },
  {
    "alwaysInSummary": false,
    "displayName": "Rule table",
    "name": "rule_table",
    "simpleTableColumns": [
      {
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "defaultValue": "",
        "displayName": "If",
        "name": "entry",
        "type": "TEXT"
      },
      {
        "selectItems": [
          {
            "displayValue": "equals",
            "value": "equals"
          },
          {
            "displayValue": "contains",
            "value": "contains"
          },
          {
            "displayValue": "starts with",
            "value": "startsWith"
          },
          {
            "displayValue": "ends with",
            "value": "endsWith"
          },
          {
            "displayValue": "matches RegEx",
            "value": "matchesRegEx"
          },
          {
            "displayValue": "matches RegEx (ignore case)",
            "value": "matchesRegExIgnoreCase"
          },
          {
            "displayValue": "does not equal",
            "value": "doesNotEqual"
          },
          {
            "displayValue": "does not contain",
            "value": "doesNotContain"
          },
          {
            "displayValue": "does not start with",
            "value": "doesNotStartWith"
          },
          {
            "displayValue": "does not end with",
            "value": "doesNotEndWith"
          },
          {
            "displayValue": "does not match RegEx",
            "value": "doesNotMatchRegEx"
          },
          {
            "displayValue": "does not match RegEx (ignore case)",
            "value": "doesNotMatchRegExIgnoreCase"
          },
          {
            "displayValue": "less than",
            "value": "lessThan"
          },
          {
            "displayValue": "less than or equal to",
            "value": "lessThanOrEqualTo"
          },
          {
            "displayValue": "greater than",
            "value": "greaterThan"
          },
          {
            "displayValue": "greater than or equal to",
            "value": "greaterThanOrEqualTo"
          }
        ],
        "defaultValue": "equals",
        "displayName": "Matches",
        "name": "method",
        "type": "SELECT"
      },
      {
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "defaultValue": "",
        "displayName": "This",
        "name": "comparator",
        "isUnique": false,
        "type": "TEXT"
      },
      {
        "selectItems": [],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "defaultValue": "",
        "displayName": "Return",
        "name": "returnValue",
        "type": "TEXT"
      }
    ],
    "type": "SIMPLE_TABLE",
    "newRowButtonText": "Else If"
  },
  {
    "type": "TEXT",
    "name": "default_value",
    "displayName": "Else (default value, leave empty to return undefined)",
    "simpleValueType": true
  }
]


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
const log = require('logToConsole');
log('data =', data);
const defaultValue = data.default_value;
//log('default =', defaultValue);

const RULE = {
  equals: (entry,comp) => {
  	return entry == comp;
  },
  contains: (entry,comp) => {
  	return (0 < entry.indexOf(comp));
  },
  startsWith: (entry,comp) => {
  	return entry.match('^'+comp);
  },
  endsWith: (entry,comp) => {
  	return entry.match(comp+'$');
  },
  /***
   *** not available
  matchesCssSelector: (entry,comp) => {
  	return entry.match(comp); // wip
  },
  ***/
  matchesRegEx: (entry,comp) => {
  	return entry.match(comp);
  },
  matchesRegExIgnoreCase: (entry,comp) => {
  	return entry.toLowerCase().match(comp.toLowerCase());
  },
  doesNotEqual: (entry,comp) => {
  	return entry != comp;
  },
  doesNotContain: (entry,comp) => {
  	return (0 > entry.indexOf(comp));
  },
  doesNotStartWith: (entry,comp) => {
  	return !entry.match('^'+comp);
  },
  doesNotEndWith: (entry,comp) => {
  	return !entry.match(comp+'$');
  },
  /***
   *** not available
  doesNotMatchCssSelector: (entry,comp) => {
  	return false; // wip
  },
  ***/
  doesNotMatchRegEx: (entry,comp) => {
  	return !entry.match(comp);
  },
  doesNotMatchRegExIgnoreCase: (entry,comp) => {
  	return !entry.toLowerCase().match(comp.toLowerCase());
  },
  lessThan: (entry,comp) => {
  	return entry < comp;
  },
  lessThanOrEqualTo: (entry,comp) => {
  	return entry <= comp;
  },
  greaterThan: (entry,comp) => {
  	return entry > comp;
  },
  greaterThanOrEqualTo: (entry,comp) => {
  	return entry >= comp;
  }
};

const rules = data.rule_table;
if ('undefined' != typeof rules) {
  for (let i=0; i<rules.length; i++) {
    const rule = rules[i];
    if ( RULE[rule.method](rule.entry,rule.comparator) ) return rule.returnValue;
  }
}

// Variables must return a value.
return defaultValue;


___NOTES___

/*** SUBLIMETRIX ***/
Version: 1.0.0
Author: Sublimetrix
Date: 2019.10.09
/*******************/

Change Log:
1.0.0: Initial Version
1.1.0: Default value
