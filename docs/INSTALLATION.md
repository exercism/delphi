# Installing Delphi and DUnitX Testing Framework #
### Windows ###

A 30 day free trial of Embarcadero's RAD Studio or Delphi may be downloaded from [here](https://www.embarcadero.com/products?utm_source=google&utm_medium=cpc&utm_campaign=brand&utm_content=brand&utm_embarcadero&gclid=CjwKEAiAp97CBRDr2Oyl-faxqRMSJABx4kh9V8bOEuG0CznQ9AGToIyuKeTzvevljmHTboYXk4n6OxoC4Frw_wcB).  Alternatively, a free [Starter Edition](https://www.embarcadero.com/products/delphi/starter/promotional-download) version is also available.  Follow installation instructions included with the product.

### Non-Windows based Operating Systems ###

Delphi will not run in a non-Windows based operating system.  However, it is possible to run Delphi within a virtual machine that is hosting Windows.

### Installing DUnitX Test Framework ###
DUnitX comes installed in Delphi version XE8 and up with an exception for the Starter Edition of Delphi.

With Delphi successfully installed, and working correctly, please follow these steps for retrieving and installing DUnitX if you find that your installation of Delphi is lacking the DUnitX framework.

- DUnitX is an open source project by [VSoftTechnologies](https://www.github.com/VSoftTechnologies).  The DUnitX GitHub repo is available [here](https://github.com/VSoftTechnologies/DUnitX).
- It is best to fork the repo and then clone or otherwise download the fork to your local machine.
- Step-by-step instructions on how to install DUnitX into Delphi have been posted by Vincent Parrett in a blog post located [here](https://www.finalbuilder.com/resources/blogs/postid/702/dunitx-has-a-wizard).
- The Starter Edition of Delphi doesn't allow the use of project experts.  DUnitX comes with an expert which will aid the student in creating a new DUnitX based project.  The expert creates the project's .DPR file.  The exercises in this track all include the .DPR file making the expert not necessary.  DUnitX otherwise has no issues with projects created in Delphi versions starting with XE all the way up to and including the Starter Edition of Berlin.

*Note: It is assumed that Delphi versions XE and higher are being utilized by the student.*
