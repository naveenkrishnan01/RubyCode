class HTMLReport
  # Initialize the report class
  def initialize()
    @overallResult = 'PASS'
    @reportContent1 = ''
    @reportContent2 = ''
    @start_time = Time.now
    @passed = 0
    @failed = 0
  end
 
  def createReport(reportName, header, browser_type)
   
    @reportName = reportName
   
    def get_date
      Time.now.strftime("%m.%d.%y")
    end
    def get_time
      Time.now.strftime("%I.%M.%S.%p")
    end
   
    # Create the report name
    d = self.get_date
    t = self.get_time
    strTime = "#{d}-#{t}.html"
    strNiceTime = "#{d} @ #{t}"
    strTotalReport = "results\\" + reportName + '_' + browser_type + '-' + strTime
    # Create the HTML report
    strFile = File.open(strTotalReport, 'w')
    # Format the header of the HTML report
 @reportContent1 = '<html>
      <head>
      <meta content=text/html; charset=ISO-8859-1 http-equiv=content-type>
      <title>Test Report: ' + header + '</title>
      <link rel="stylesheet" type="text/css" href="../RubyCode/classes/bluegray.css">
      </head>
      <body>
      <br />
      <center>
      <table width=800 border=0 cellpadding=0 cellspacing=0>
      <tbody>
      <tr>
      <td>
      <table width=100% border=0 cellpadding=2 cellspacing=2>
      <tbody>
      <tr>
      <th class="header" align=right>Test Report: ' + header + '</th>
      </tr>
      </tbody>
      </table>
      <br />
      <center>
      <table border=0 width=95% cellpadding=0 cellspacing=0>
      <tbody>
      <tr>
      <th width=15%>File Name:</th>
      <td width=85% colspan=5 align="center">' + reportName + '-' + strTime + '</td>
      </tr>
      <tr>
      <th class="nobg" width=15%>Test Date:</th>
      <td width=30% align="center">' + strNiceTime + '</td>
      <th class="nobg" width=15%>Test Result:</th>'


@reportContent2 = '
      </center>
      <br><br>
      <center>
      <table width=95% cellpadding=2 cellspacing=0>
      <tbody>
      <tr>
      <th width=45%>Test Step</th>
      <th width=10%>Result</th>
      <th width=45%>Description</th>
      </tr>'
     
    # Close the report
    strFile.close
       
    return strTotalReport
  end
 
  def newTestName(name)
    @reportContent2 = @reportContent2 + '<tr><td class ="alt" colspan="3">' + name + '</td></tr>'
  end
 
  def addtoReport(step, result, description)
    @reportContent2 = @reportContent2 + '<tr><td class="step">' + step + '</td>'
    # Format the body of the HTML report
    if result == 'PASS'
      @reportContent2 = @reportContent2 + '<td class="result_pass">' + result + '</td>'
      @passed += 1
    else
      @overallResult = 'FAIL'
      @reportContent2 = @reportContent2 + '<td class="result_fail">' + result + '</td>'
      @failed += 1
    end

@reportContent2 = @reportContent2 + ' <td class="result_text">' + description + '</td></tr>'
  end
 
  def add_to_report(result, test, pass_text, fail_text)
    result == true ? self.addtoReport(test, 'PASS', pass_text) : self.addtoReport(test, 'FAIL', fail_text)
  end
 
  # formats seconds to minutes, seconds
  def format_test_time(seconds)
    if seconds < 60
      "0 min, #{"%.02f" % seconds} sec"
    else
      minutes = (seconds/60).to_i
      seconds = seconds - (minutes*60)
      "#{minutes} min, #{"%.02f" % seconds} sec"
    end
  end
 
  def finishReport(reportName, browser, env)
    # Open the HTML report
    strFile = File.open(reportName, 'a')
    # Format the footer of the HTML report
    @reportContent2 = @reportContent2 + '</table>
      <br><br>
      <hr width=100% size=1px>
      <br />
      <center><h5>&copy;CompanyName 2009</h5></center>
      <br>'

strFile.puts(@reportContent1)
    total = @passed + @failed
    percent_pass = ((@passed.to_f/total * 100)).to_s
    percent_fail = ((@failed.to_f/total * 100)).to_s
    strFile.puts('<td align="center" colspan=3>' + '<b><font color="green">' + "%.02f" % percent_pass + '% Passed, ' + '<font color="red">' + "%.02f" % percent_fail + '% Failed' + '</b></td></tr>')
    # get test time
    seconds = (Time.now - @start_time)
    test_time = self.format_test_time(seconds)
    strFile.puts('</tr>
      <th width=15%>Run time:</th>
      <td width=20% align="center">' + test_time  + '</td>
      <th width=15%>Browser:</th>
      <td align="center" width=20%><img src="../classes/images/' + browser.downcase + '.gif" width=30%/></td>
      <th width=10%>Env:</th>
      <td align="center">' + env + '</td>
      </tr>
      </tbody></table>')
    strFile.puts(@reportContent2)
  
    # Close the report
    strFile.close
  end
end

