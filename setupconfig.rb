#!/usr/bin/ruby
require 'selenium-webdriver'
require 'mail'
require "net/https"
require "net/http"
require "uri"
require "rest_client"


# Define test environment and getWebdriver

$driver = nil

def getEnv()
    
    env_baseurls = {
        "betastg" => "http://betastg.oprah.com",
        "prod" => "http://www.oprah.com",
        "src" => "http://wwwsrc.oprah.com",
        "livestg" => "http://www.oprah.com",
        "o20dev" => "http://o20-dev.oprah.com",
        "o20prod" => "http://www.oprah.com",
        "o20src" => "http://wwwsrco2.oprah.com",
    }
    
    env = ARGV[0] || "o20dev"
    unless env_baseurls.keys.include? env
        puts "Please select env from one of: "
        env_baseurls.keys.each do |_env, base_url|
            print _env + " , "
        end
        puts
        exit 0
    end
    
    return env_baseurls[env]
    
end

def getRunAt()
    
    supported_run_at = ["local", "remote"]
    run_at = ARGV[1] || "local"
    unless supported_run_at.include? run_at 
        puts "Please select one of supported run_at: "
        supported_run_at.each do |item|
        	print item + " , "
	end
        puts
        exit 0
    end
    return run_at

end

def getBrowser()

    supported_browsers = ["firefox", "ie", "chrome", "safari"]
    browser = ARGV[2] || "firefox" 
    unless supported_browsers.include? browser
        puts "Please select one of supported browsers: "
        supported_browsers.each do |item|
            	print item + " , "
        end
        puts
        exit 0
    end
    return browser

end

def getBrowserVersion()
    
    supported_browser_versions = []
    browser_version = ARGV[3]
    if browser_version.nil?
        puts "Please provide a browser and OS version"
        exit 0
    end
    return browser_version
end
    
def getOSVersion()
    
    supported_os_versions = []
    os_version = ARGV[4]
    if os_version.nil?
        puts "Please provide OS version"
        exit 0
    end
    return os_version
    
end


def startDriver()

url = getEnv()
run_at = getRunAt()
browser = getBrowser()

if run_at == "local"
    
    case browser
        when "firefox"
            profile = Selenium::WebDriver::Firefox::Profile.new
            $driver = Selenium::WebDriver.for :firefox, :profile => profile
        when "ie"
            $driver = Selenium::WebDriver.for :ie
        when "chrome"
            $driver = Selenium::WebDriver.for :chrome
        when "safari"
            $driver = Selenium::WebDriver.for :safari
     end

else
        
    browser_version = getBrowserVersion()
    os_version = getOSVersion()
    
    case browser
        when "firefox"
            caps = Selenium::WebDriver::Remote::Capabilities.firefox
        when "ie"
            caps = Selenium::WebDriver::Remote::Capabilities.ie
        when "chrome"
            caps = Selenium::WebDriver::Remote::Capabilities.chrome
        when "safari"
            caps = Selenium::WebDriver::Remote::Capabilities.safari
        when "opera"
            caps = Selenium::WebDriver::Remote::Capabilities.opera	
    end
    
    caps.version = browser_version
    caps.platform = os_version
    caps[:name] = "Functionality test on #{browser} on version #{browser_version} and platform #{os_version}"
    $driver = Selenium::WebDriver.for(
                                      :remote,
                                      :url => "http://ownqa:66f9ac4a-4fe0-44d3-bddf-4106bd38985e@ondemand.saucelabs.com:80/wd/hub",
                                      :desired_capabilities => caps)
    
    # move the session-id to your script
    #   @session_id = @driver.instance_variable_get("@bridge").instance_variable_get("@session_id")
    
    #   puts "http://ownqa:66f9ac4a-4fe0-44d3-bddf-4106bd38985e@saucelabs.com/jobs/#{@session_id}"
    
    
end
    
if url.include? "betastg"
$driver.navigate.to 'http://ownaccess:oprah@betamyown.oprah.com/dump.html'
$driver.navigate.to 'http://ownaccess:oprah@betastg.oprah.com/index.html'
$driver.navigate.to 'https://ownaccess:oprah@betamyown.oprah.com/dump.html'
$driver.navigate.to 'https://ownaccess:oprah@betastg.oprah.com/index.html'
end

unless ARGV[0].nil?
        if ARGV[0].include? "livestg"
        $driver.navigate.to 'http://myown.oprah.com/cookieMgr.html'
        $driver.find_element(:id, "check_staging").send_keys("1")
        $driver.find_element(:id, "save-cookies").click
        sleep (2)
        end
end
    
unless ARGV[0].nil?
        if ARGV[0].include? "o20prod" or ARGV[0].include? "o20src"
            $driver.navigate.to 'http://ownaccess:oprah@betamyown.oprah.com/dump.html'
            $driver.navigate.to 'http://ownaccess:oprah@betastg.oprah.com/index.html'
            $driver.navigate.to 'https://ownaccess:oprah@betamyown.oprah.com/dump.html'
            $driver.navigate.to 'https://ownaccess:oprah@betastg.oprah.com/index.html'
            $driver.navigate.to 'http://betamyown.oprah.com/cookieMgr.html'
            $driver.find_element(:id, "betao2").send_keys("1")
            $driver.find_element(:id, "BYPASS_PAGE_CACHE").send_keys("1")
            $driver.find_element(:id, "save-cookies").click
            sleep (2)
        end
end

    

end


def getCurrentDriver()
    
    return $driver

end

def open(url)

    $driver.navigate.to url
    sleep (2)
end
    

def getElement(elem_hash)
    
    by = elem_hash.first.first
    path = elem_hash[by]
    sleep (1)
    
    case by
        when "xpath"
            return $driver.find_element(:xpath, path)
        when "id"
            return $driver.find_element(:id, path)
        when "name"
            return $driver.find_element(:name, path)
        else
            puts "By locator not defined -> " + by.to_s
    
    end

end

def getElements(elem_hash)
    
    by = elem_hash.first.first
    path = elem_hash[by]
    sleep (1)
    
    case by
        when "xpath"
        return $driver.find_elements(:xpath, path)
        else
        puts "By locator not defined -> " + by.to_s
        
    end
    
end

def click(elem_hash)
    
    elem = getElement(elem_hash)
    elem.click
    sleep (2)
    
end
    

def compare_currentUrl(expected_url)
    
    result = ($driver.current_url.include? expected_url) ? true : false
    return result
    
end
    

    
def compare_currentText(expected_text)
    
    result = ($driver.find_element(:xpath, '//body').text.include? expected_text) ? true : false
    return result
    
end

def takeSnapshot(filename)
    
        $driver.save_screenshot(filename)
end

def windowResize(x_coord, y_coord)
    
    $driver.manage.window.resize_to(x_coord, y_coord)
    
end
    
def fill_field(elem_hash, name)
    
    _elem = getElement(elem_hash)
    _elem.clear
    sleep (1)
    _elem.send_keys(name)
end

def endTest()
    
   $driver.quit
    
end

def printTime(text)
    
    puts
    puts text
    puts Time.now
end

def printText(text)
    
    puts text
    
end

def drag_and_drop(_from, _to)
    
   $driver.action.drag_and_drop(_from, _to).perform
    
end

def getCurrentUrl()
    
    return $driver.current_url
end

def sendemail(email_text, email_file = nil)
    
	options = { :address              => "smtp.gmail.com",
        :port                 => 587,
        :domain               => 'localhost',
        :user_name            => 'oprahown.qa',
        :password             => 'oprah123',
        :authentication       => 'plain',
        :enable_starttls_auto => true
	}
    
    
    Mail.defaults do
        delivery_method :smtp, options
    end
    
    Mail.deliver do
        to 'allqa@own.oprah.com'
        from 'oprahown.qa@gmail.com'
        subject 'Automation Test Results'
        body "Here is the email content: \n" + email_text
        unless email_file.nil?
        add_file("#{email_file}")
        end
    end
    
end

def setTestStatus(text)
    
    if getRunAt() == "remote"
        session_id = $driver.instance_variable_get("@bridge").instance_variable_get("@session_id")
        if text == "false"
            RestClient.put("http://ownqa:66f9ac4a-4fe0-44d3-bddf-4106bd38985e@saucelabs.com/rest/v1/ownqa/jobs/#{session_id}", {"passed" => false}.to_json, {:content_type => "application/json"})
        else
            RestClient.put("http://ownqa:66f9ac4a-4fe0-44d3-bddf-4106bd38985e@saucelabs.com/rest/v1/ownqa/jobs/#{session_id}", {"passed" => true}.to_json, {:content_type => "application/json"})
        end
        
        puts "Output for saucelab"
        puts "http://ownqa:66f9ac4a-4fe0-44d3-bddf-4106bd38985e@saucelabs.com/jobs/#{session_id}"
    end
    
end


def getHttpResponse(myurl, cookie = nil, num_tries = nil)
    
    numOf404Tries = num_tries || 1
    
    begin
        uri = URI.parse(myurl)
        scheme = uri.scheme
        hosturl = uri.host
        hostport = uri.port
        http = Net::HTTP.new(uri.host, uri.port)
        if myurl.include? "https"
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        end
        request = Net::HTTP::Get.new(uri.request_uri, cookie)
        request.basic_auth("ownaccess", "oprah")
        response = http.request(request)
        puts myurl + " --> " + response.code
        if response.code == "301" || response.code == "302"
            if response.header["location"].include? "http"
                myurl = response.header["location"]
                getHttpResponse(myurl, cookie, numOf404Tries)
                else
                myurl = scheme + "://" + hosturl + response.header["location"]
                getHttpResponse(myurl, cookie, numOf404Tries)
            end
        end
        error_codes = ["403", "404", "500"]
        if error_codes.include? response.code and numOf404Tries < 3
            numOf404Tries += 1
            getHttpResponse(myurl, cookie, numOf404Tries)
        end
        
        return response.code
        
    rescue Exception => e
        puts myurl + " --> #{e.message}"
        
    end
end


def readfileUrls(myfile_path)
    
    begin
    
    read_file = File.open(myfile_path, 'r')
    all_urls = []
    IO.foreach (read_file) { |line|
        if line.include? "http"
            all_urls.push(line.scan(/https?:\/\/www.\S*[^",]\w/))
        end
    }
    read_file.close
    
    rescue Exception => e
        puts e.message
    end
    
    return all_urls

end


def run_files_by_fname (filename, dir = nil)
    
    dir  = dir || "."
    rbfiles = File.join("#{dir}", "#{filename}")
    myfiles = Dir.glob(rbfiles)
    
    unless myfiles.count == 0
        myfiles.each do |file|
            sleep 1
            puts file
            system ("ruby #{file} #{ARGV[0]} #{ARGV[1]} #{ARGV[2]} #{ARGV[3]} #{ARGV[4]}")
        end
    else 
        puts "No files found for: #{filename} in: #{dir}"
    end

end

def navigate_back()
                                
    $driver.navigate.back

end
                                    

                                    
def is_element_present(elem, timer = nil)

	begin
		timer = timer || 5
		wait = Selenium::WebDriver::Wait.new(:timeout => timer)
		wait.until {getElement(elem)}
		check_element = true
	
    rescue Exception => e
		check_element = false

	end

	return check_element

end
		

