# Installing Delphi and DUnitX Testing Framework #
### Windows ###

A 30 day free trial of Embarcadero's RAD Studio or Delphi may be downloaded from [here](https://www.embarcadero.com/products?utm_source=google&utm_medium=cpc&utm_campaign=brand&utm_content=brand&utm_embarcadero&gclid=CjwKEAiAp97CBRDr2Oyl-faxqRMSJABx4kh9V8bOEuG0CznQ9AGToIyuKeTzvevljmHTboYXk4n6OxoC4Frw_wcB).  Alternatively, a free [Community Edition](https://www.embarcadero.com/products/delphi/starter) version is also available.  Follow installation instructions included with the product.

### Non-Windows based Operating Systems ###

Delphi will not run in a non-Windows based operating system.  However, it is possible to run Delphi within a virtual machine that is hosting Windows.

### Installing DUnitX Test Framework ###
DUnitX may be optionally installed while installing Delphi versions XE8 and up.  However, I recommend following the instructions below and manually, obtaining a copy of DUnitX directly from the authors GitHub repository as it is updated more frequently.

With Delphi successfully installed, and working correctly, please follow these steps for retrieving and installing DUnitX if you find that your installation of Delphi is lacking the DUnitX framework.

- DUnitX is an open source project by [VSoftTechnologies](https://www.github.com/VSoftTechnologies).  The DUnitX GitHub repo is available [here](https://github.com/VSoftTechnologies/DUnitX).
- It is best to fork the repo and then clone or otherwise download the fork to your local machine.
- Step-by-step instructions on how to install DUnitX into Delphi have been posted by Vincent Parrett in a blog post located [here](https://www.finalbuilder.com/resources/blogs/postid/702/dunitx-has-a-wizard).
- The Starter Edition of Delphi doesn't allow the use of project experts.  DUnitX comes with an expert which will aid the student in creating a new DUnitX based project.  The expert creates the project's .DPR file.  The exercises in this track all include the .DPR file making the expert not necessary.  DUnitX otherwise has no issues with projects created in Delphi versions starting with XE all the way up to and including the Starter Edition of Berlin.

### Delphi Configuration for DUnitX ###

If you had to install DUnitX because your installation didn't already come with it then please follow the following illustrated steps to make the necessary configuration changes to Delphi in order for it to locate your installation of DUnitX.

*Note: it is assumed that you have completed the installation of Delphi by this point.*

- Start Delphi.  If your installation is new you will most likely end up at a `Welcome Page` similar to this.

[![Welcome Page](https://raw.githubusercontent.com/exercism/delphi/master/docs/img/00delphiwelcomepageLogo.png)](https://raw.githubusercontent.com/exercism/delphi/master/docs/img/00delphiwelcomepage.png)

- Find and click `Tools` along the top menu.
 
![Tools](https://raw.githubusercontent.com/exercism/delphi/master/docs/img/01delphiclicktools.png)

- Click `Options`.

![Options](https://raw.githubusercontent.com/exercism/delphi/master/docs/img/02delphiclickoptions.png)

- Along the left side of the Options screen find and click on `Environment Variables`.

[![Options Screen Environment Variables](https://raw.githubusercontent.com/exercism/delphi/master/docs/img/03delphioptionsenvironmentvariablesLogo.png)](https://raw.githubusercontent.com/exercism/delphi/master/docs/img/03delphioptionsenvironmentvariables.png)

- Click the `New` button located in the `User overrides` group 

![Click New](https://raw.githubusercontent.com/exercism/delphi/master/docs/img/04delphioptionsenvironmentvariablesclicknew.png)

- A New User Variable window should appear that contains two fields.  In the top field enter `DUNITX` for the Variable Name.  In the bottom field enter the complete path to your copy of DUnitX, for example mine is `C:\Program Files\Embarcadero\Studio\19.0\source\DUnitX`.  *you may not have a folder 19.0, it depends on the version of Delphi installed.*  Click the `Ok` button to then close this window.

![New User Variable](https://raw.githubusercontent.com/exercism/delphi/master/docs/img/05delphinewuservariable.png)

- Locate and click on `Library` along the left side of the Options screen.

[![Library](https://raw.githubusercontent.com/exercism/delphi/master/docs/img/06delphioptionslibraryLogo.png)](https://raw.githubusercontent.com/exercism/delphi/master/docs/img/06delphioptionslibrary.png)

- Click the `...` button associated with the Library path in the Directories group

[![...button](https://raw.githubusercontent.com/exercism/delphi/master/docs/img/07delphiclicklibrarypathbuttonLogo.png)](https://raw.githubusercontent.com/exercism/delphi/master/docs/img/07delphiclicklibrarypathbutton.png)

- In the Directories window enter the variable name that you created a few steps ago.  The entry should appear like this `$(DUNITX)` 

![Directories](https://raw.githubusercontent.com/exercism/delphi/master/docs/img/08delphidirectoriesinputvarnameclickadd.png)

- Click the `Add` button to add this new item to the list.

- Click the `Ok` button to store the change.


- Finally, click the `Ok` button on the Options window to save all the changes.

Delphi will now be able to locate units that pertain to the DUnitX testing framework library.

*Note: It is assumed that Delphi versions XE and higher are being utilized by the student.*
