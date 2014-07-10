GroupWise Schemas


The GroupWise WSDL and schemas are written using industry standards from W3c.  You can find the link to the XML schemas definitions at:  http://www.w3.org/XML/Schema.  From the point of GroupWise, we provide developers schemas and WSDL files.  Developers decide the specific development framework they want to use to build GroupWise applications.  Each development framework compiles its own library with the GroupWise schemas and WSDL.  Different frameworks have different levels of support for Web Services.  This means that each generated library could have a different set of bugs.

In GroupWise development, we have tested with Sun's Java libraries and Microsoft .Net.  Sun's Java libraries support our schemas without any modifications.  However, we have found some issues with Microsoft's implementation of the GroupWise schemas.  For Microsoft .Net 2003 and 2005, we provide a set of schemas that will work. 


GroupWise 2012

We have included the GroupWise 2012 schemas. You will find the shipping schemas for GroupWise 2012 and 2012 SP1.


GroupWise 8

In GroupWise 8, we have consolidated the schemas down to one set for all frameworks.  In GroupWise 7, we had a general set of schemas for all frameworks except .Net.  We had a separate set of schemas for .Net.

In the GW8 directory, you will find the WSDL and schema files.  Below this is a directory called "Differences - GW703 and GW8".  This directory contains the differences between the GroupWise 7.03 and GroupWise 8 WSDL and schemas in HTML format.  This may prove useful in understanding the changes.


GroupWise 7 Only

We have included the GroupWise 7 schemas for convenience.  You will find the shipping schemas for GroupWise 7 SP1, SP2 and SP3.



Using the Right Schema in GroupWise 7

With each iteration of GroupWise, GroupWise schemas and WSDL will change.  Our intention is to make sure that we are backward compatible with older versions of the schema.  However, we can't predict how each development framework will react to schema changes.  We don't have the time or the resources to verify that all developement frameworks are backward compatible with our schema changes.

In the GroupWise Web Services download, you will find the "WSDL and schema" directory.  In that directory, you will find the GW7SP1 and GW7SP2 directory.  It has the GroupWise 7 SP1 and SP2 WSDL and schemas.  We recommend using the SP2 schemas.  Libraries build using the SP2 schemas should work with GroupWise 7 SP1 POAs.  

If you are using Microsoft .Net 2003 or 2005.  See below for more information.


Microsoft .Net 2003 and 2005

We have found that Microsoft .Net 2003 and 2005 do not support some W3C schema elements.  We have modified the schemas to address the issues.  You can find the .Net schemas in the MS.Net directory below the WSDL and schemas directory.  We can't say for certain that we have identified all .Net schema issues.  Despite the schema changes, we believe that GroupWise Web Services and .Net should work together.

The following list is not comprehensive.  Diff the schemas in the "WSDL and schemas" and the MS.Net directory for a complete list.
