<#Author: Brian
  Date: 14-DEC-2019
  Version: 2.0

  ~~~~~~~NOTES~~~~~~~
  //TODO
  1) Checklist
     -List everything and have the ability to check off items
  2) Create the buttons for each checklist item

  ~~~~~~~NOTES~~~~~~~
#>


Function Test-Window
{
    [System.Windows.MessageBox]::Show('Hello','Header')
}
Function Test-GUI
{
    #Creates the main form window
    Add-Type -assembly System.Windows.Forms
    Add-Type -assembly System.Drawing
    $main_form = New-Object System.Windows.Forms.Form
    $main_form.Size = New-Object System.Drawing.Size(1200,1200)
    $main_form.StartPosition = "CenterScreen" 
    $main_form.FormBorderStyle = 'Fixed3D' 
    $main_form.Text = "My Application"
    
    #Creates an array of buttons
    $ArrayOfButtons = New-Object System.Collections.ArrayList
    $ArrayOfButtons.Add((Create-Button -Name "Add Users" -xCoord 10 -yCood 10))
    $ArrayOfButtons.Add((Create-Button -Name "Remove Users" -xCoord 10 -yCood (10+($ArrayOfButtons.Count * 60))))
    
    #The Functionality behind the "Add Users" button
    $ArrayOfButtons[0].Add_Click(
    {
        $new_form = New-Object System.Windows.Forms.Form
        $new_form.Size = New-Object System.Drawing.Size(575,575)
        $new_form.StartPosition = "CenterScreen"
        $new_form.MaximizeBox = $false
        $new_form.MinimizeBox = $false
        $new_form.HelpButton = $true
        $new_form.FormBorderStyle = 'Fixed3D' 
        $new_form.Text = "New User"
        
        #Creates an array of labels
        $Labels = New-Object System.Collections.ArrayList
        $Labels.Add((Create-Label -Text "User name:" -xCoord 15 -yCoord (30+($Labels.Count * 40)) -xSize 100 -ySize 20 -FontSize 8))
        $Labels.Add((Create-Label -Text "Full name:" -xCoord 15 -yCoord (30+($Labels.Count * 40)) -xSize 100 -ySize 20 -FontSize 8))
        $Labels.Add((Create-Label -Text "Description:" -xCoord 15 -yCoord (30+($Labels.Count * 40)) -xSize 100 -ySize 20 -FontSize 8))
        #The follow label is used to create a thin grey line
        $Labels.Add((Create-Label -Text "" -xCoord 15 -yCoord (30+($Labels.Count * 40)) -xSize 535 -ySize 2 -FontSize 8))
        $Labels[3].BorderStyle = 'Fixed3D'
        $Labels[3].AutoSize = $false
        $Labels.Add((Create-Label -Text "Password:" -xCoord 15 -yCoord (30+($Labels.Count * 40)) -xSize 100 -ySize 20 -FontSize 8))
        $Labels.Add((Create-Label -Text "Confirm Password:" -xCoord 15 -yCoord (30+($Labels.Count * 40)) -xSize 100 -ySize 20 -FontSize 8))

        #Creates an array of textboxes
        $Textboxes = New-Object System.Collections.ArrayList
        for($i=0;$i -lt 3;$i++){$Textboxes.Add((Create-Textbox -xCoord 150 -yCoord (20+($Textboxes.Count * 40)) -xSize 400 -ySize 20 -FontSize 14))}
        for($i=0;$i -lt 2;$i++){$Textboxes.Add((Create-Textbox -xCoord 175 -yCoord (60+($Textboxes.Count * 40)) -xSize 375 -ySize 20 -FontSize 14))
                                $Textboxes[(3+$i)].UseSystemPasswordChar = $true} #Sets it so that password field is covered
        <# Saving these just in case 14DEC2019
        $Textboxes.Add((Create-Textbox -xCoord 150 -yCoord (20+($Textboxes.Count * 40)) -xSize 400 -ySize 20))
        $Textboxes.Add((Create-Textbox -xCoord 150 -yCoord (20+($Textboxes.Count * 40)) -xSize 400 -ySize 20))
        $Textboxes.Add((Create-Textbox -xCoord 150 -yCoord (20+($Textboxes.Count * 40)) -xSize 400 -ySize 20))
        $Textboxes.Add((Create-Textbox -xCoord 175 -yCoord (60+($Textboxes.Count * 40)) -xSize 375 -ySize 20))
        $Textboxes.Add((Create-Textbox -xCoord 175 -yCoord (60+($Textboxes.Count * 40)) -xSize 375 -ySize 20))#>
        #Creates an array of RadioButtons
        $Radioes = New-Object System.Collections.ArrayList
        $Radioes.Add((Create-RadioButton -Text "User Must change password at next logon" -xCoord 15 -yCoord 280))
        $Radioes.Add((Create-RadioButton -Text "User cannot change password" -xCoord 15 -yCoord 310))
        $Radioes.Add((Create-RadioButton -Text "Password never expires" -xCoord 15 -yCoord 340))
        $Radioes.Add((Create-RadioButton -Text "Account is disabled" -xCoord 15 -yCoord 370))

        #Find a way to grey out the button
        $CreateButton = Create-Button -Name "Create" -xCoord 316 -yCood 480
        $CreateButton.Size = '112,36'
        $CreateButton.Font =  New-Object System.Drawing.Font("Arial",8,[System.Drawing.FontStyle]::Regular)
        $CreateButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
        $new_form.AcceptButton = $CreateButton
        $new_form.Controls.Add($CreateButton)
        
        $CancelButton = Create-Button -Name "Close" -xCoord 438 -yCood 480
        $CancelButton.Size = '112,36'
        $CancelButton.Font =  New-Object System.Drawing.Font("Arial",8,[System.Drawing.FontStyle]::Regular)
        $CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
        $new_form.CancelButton = $CancelButton
        $new_form.Controls.Add($CancelButton)

        #Add the Labels and Textboxes to the add user form
        for($i=0;$i -lt $Labels.Count;$i++){$new_form.Controls.Add(($Labels[$i]))}
        for($i=0;$i -lt $Textboxes.Count;$i++){$new_form.Controls.Add(($Textboxes[$i]))}
        for($i=0;$i -lt $Textboxes.Count; $i++){Write-Host $Textboxes[$i].Text}
        for($i=0;$i -lt $Radioes.Count; $i++){$new_form.Controls.Add(($Radioes[$i]))}
        
        
        $new_form.ShowDialog()
    })

    #Adds the Buttons to the form to be displayed
    for($i=0;$i -lt $ArrayOfButtons.Count;$i++){$main_form.Controls.Add(($ArrayOfButtons[$i]))}
    
    
    <#
    $OKButton = New-Object System.Windows.Forms.Button
    $OKButton.Location = New-Object System.Drawing.Point(75,120)
    $OKButton.Size = New-Object System.Drawing.Size(75,23)
    $OKButton.Text = 'OK'
    $OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $main_form.AcceptButton = $OKButton
    $main_form.Controls.Add($OKButton)

    $CancelButton = New-Object System.Windows.Forms.Button
    $CancelButton.Location = New-Object System.Drawing.Point(150,120)
    $CancelButton.Size = New-Object System.Drawing.Size(75,23)
    $CancelButton.Text = 'Cancel'
    $CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
    $main_form.CancelButton = $CancelButton
    $main_form.Controls.Add($CancelButton)
    
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,20)
    $label.Size = New-Object System.Drawing.Size(280,20)
    $label.Text = 'Please enter the information in the space below:'
    $main_form.Controls.Add($label)

    $textBox = New-Object System.Windows.Forms.TextBox
    $textBox.Location = New-Object System.Drawing.Point(10,40)
    $textBox.Size = New-Object System.Drawing.Size(260,20)
    $main_form.Controls.Add($textBox)

    $main_form.Topmost = $true

    $main_form.Add_Shown({$textBox.Select()})
    $result = $main_form.ShowDialog()
    
    if ($result -eq [System.Windows.Forms.DialogResult]::OK)
    {
        $x = $textBox.Text
        $x
    }
    #>
    
    $Label = New-Object System.Windows.Forms.Label
    $Label.Text = "AD users"
    $Label.AutoSize = $true
    $Label.Location  = New-Object System.Drawing.Point(800,10)
    $Label.Size = New-Object System.Drawing.Size(100,30)
    $main_form.Controls.Add($Label)
    
    $Label = New-Object System.Windows.Forms.Label 
    $Label.Text = "This is a Label" 
    $Label.AutoSize = $true 
    $Label.Location = New-Object System.Drawing.Size(400,400) 
    $Font = New-Object System.Drawing.Font("Arial",20,[System.Drawing.FontStyle]::Bold) 
    $Label.Font = $Font 
    $main_form.Controls.Add($Label)
    
    
    $ComboBox = New-Object System.Windows.Forms.ComboBox
    $ComboBox.Width = 300
    #$Users = get-localuser -filter * -Properties SamAccountName
    $Users = get-localuser -Name *
    Foreach ($User in $Users)
    {
        $ComboBox.Items.Add($User.Name);
    }
    $ComboBox.Location  = New-Object System.Drawing.Point(860,10)
    $main_form.Controls.Add($ComboBox)
    
    
    $Label2 = New-Object System.Windows.Forms.Label
    $Label2.Text = "Last Password Set:"
    $Label2.Location  = New-Object System.Drawing.Point(800,40)
    $Label2.AutoSize = $true
    $main_form.Controls.Add($Label2)
    $Label3 = New-Object System.Windows.Forms.Label
    $Label3.Text = ""
    $Label3.Location  = New-Object System.Drawing.Point(110,40)
    $Label3.AutoSize = $true
    $main_form.Controls.Add($Label3)
    

    $Button = New-Object System.Windows.Forms.Button
    $Button.Location = New-Object System.Drawing.Size(1000,40)
    $Button.Size = New-Object System.Drawing.Size(120,23)
    $Button.Text = "Check"
    $main_form.Controls.Add($Button)

    
    $Button.Add_Click(
    {
        $Label3.Text =  [datetime]::FromFileTime((Get-LocalUser -identity $ComboBox.selectedItem -Properties pwdLastSet).pwdLastSet).ToString('MM dd yy : hh ss')
    }
    )
    

    $CreateButton = Create-Button -Name "Create" -xCoord 300 -yCood 500
    $CreateButton.Size = '75,23'
    $CreateButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $main_form.AcceptButton = $CreateButton
    $main_form.Controls.Add($CreateButton)

    $CancelButton = Create-Button -Name Cancel -xCoord 450 -yCood 500
    $CancelButton.Size = '75,23'
    $CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
    $main_form.CancelButton = $CancelButton
    $main_form.Controls.Add($CancelButton)


    $main_form.ShowDialog()
} 

Function Create-Button{
    param($Name, $xCoord, $yCood)
    $New_Button = New-Object System.Windows.Forms.Button
    $New_Button.Location = New-Object System.Drawing.Size($xCoord,$yCood)
    $New_Button.Size = New-Object System.Drawing.Size(330,50)
    $New_Button.Font = New-Object System.Drawing.Font("Arial",10,[System.Drawing.FontStyle]::Bold) 
    $New_Button.Text = "$Name"
    $New_Button
    #$main_form.Controls.Add($New_Button)
}

Function Create-Label{
    param($Text, $xCoord, $yCoord, $xSize, $ySize, $FontSize)
    $Label = New-Object System.Windows.Forms.Label
    $Label.Text = "$Text"
    $Label.AutoSize = $true
    $Label.Location  = New-Object System.Drawing.Point($xCoord,$yCoord)
    $Label.Size = New-Object System.Drawing.Size($xSize,$ySize)
    $Label.font = New-Object System.Drawing.Font("Arial",$FontSize,[System.Drawing.FontStyle]::Regular)
    $Label
    #$new_form.Controls.Add($Label)
}

Function Create-Textbox{
    param($xCoord, $yCoord, $xSize, $ySize, $FontSize)
    $textBox = New-Object System.Windows.Forms.TextBox
    $textBox.Location = New-Object System.Drawing.Point($xCoord,$yCoord)
    $textBox.Size = New-Object System.Drawing.Size($xSize,$ySize)
    $textBox.AutoSize = $true
    $textBox.font = New-Object System.Drawing.Font("Arial",$FontSize,[System.Drawing.FontStyle]::Regular)
    $textBox
    #$new_form.Controls.Add($textBox)
}

Function Create-RadioButton{
    param($Text, $xCoord, $yCoord)
    $RadioButton = New-Object System.Windows.Forms.RadioButton
    $RadioButton.Location = New-Object System.Drawing.Point($xCoord,$yCoord)
    $RadioButton.size = '350,20'
    #$RadioButton.Checked = $true 
    $RadioButton.Text = "$Text"
    $RadioButton.Font = New-Object System.Drawing.Font("Arial",8,[System.Drawing.FontStyle]::Regular) 
    $RadioButton
    #$new_form.Controls.Add($RadioButton)
}

Test-GUI

#https://gallery.technet.microsoft.com/scriptcenter/How-to-build-a-form-in-7e343ba3
#https://theitbros.com/powershell-gui-for-scripts/
#https://mcpmag.com/articles/2016/06/09/display-gui-message-boxes-in-powershell.aspx
#https://docs.microsoft.com/en-us/powershell/scripting/samples/creating-a-custom-input-box?view=powershell-6
#https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.form?view=netframework-4.7.2
#https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms?redirectedfrom=MSDN&view=netframework-4.7.2

