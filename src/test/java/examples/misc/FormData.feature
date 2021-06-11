Feature: Sending request using form data

  Background: 
    * def pdfdoc = read('file:src\\test\\resources\\tnc_pdf\\Edesign_tnc.pdf')
    * print pdfdoc
#    * configure proxy = 'proxyUrl'

  Scenario Outline: Working with Form Data
    Given url BaseURL + '/tnc/v1/tnc'
    * print BaseURL + '/tnc/v1/tnc'
    And multipart file pdf_document = {read: '<pdf_document>', contentType:'application/pdf'}
    And multipart field tnc_info = '{ "client_id": "<client_id>", "country":"<country>","app_version": "<app_version>","document":"SGVsbG8="}'
    And header Authorization = 'a4987727-b2b5-4473-b663-8179cd4ff5f7'
    When method post
    Then status 200

    Examples: 
      | read('classpath:org/dces/qa/docUpload/TestData_TNC_Upload3.csv') |
