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
    Add-Type -assembly System.Windows.Forms
    Add-Type -assembly System.Drawing
    $main_form = New-Object System.Windows.Forms.Form
    $main_form.Size = New-Object System.Drawing.Size(1200,1200)
    $main_form.StartPosition = "CenterScreen" 
    $main_form.FormBorderStyle = 'Fixed3D' 
    $main_form.Text = "My Application"
    
    $ArrayOfButtons = New-Object System.Collections.ArrayList
    $temp = Create-Button -Name "Add Users" -xCoord 10 -yCood 10
    $ArrayOfButtons.Add($temp)
    $temp = Create-Button -Name "Remove Users" -xCoord 10 -yCood 70
    $ArrayOfButtons.Add($temp)
    
    
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
        $Labels.Add((Create-Label -Text "User name:" -xCoord 15 -yCoord (30+($Labels.Count * 40)) -xSize 100 -ySize 20))
        $Labels.Add((Create-Label -Text "Full name:" -xCoord 15 -yCoord (30+($Labels.Count * 40)) -xSize 100 -ySize 20))
        $Labels.Add((Create-Label -Text "Description:" -xCoord 15 -yCoord (30+($Labels.Count * 40)) -xSize 100 -ySize 20))
        #The follow label is used to create a thin grey line
        $Labels.Add((Create-Label -Text "" -xCoord 15 -yCoord (30+($Labels.Count * 40)) -xSize 535 -ySize 2))
        $Labels[3].BorderStyle = 'Fixed3D'
        $Labels[3].AutoSize = $false
        $Labels.Add((Create-Label -Text "Password:" -xCoord 15 -yCoord (30+($Labels.Count * 40)) -xSize 100 -ySize 20))
        $Labels.Add((Create-Label -Text "Confirm Password:" -xCoord 15 -yCoord (30+($Labels.Count * 40)) -xSize 100 -ySize 20))

        #Creates an array of textboxes
        $Textboxes = New-Object System.Collections.ArrayList
        for($i=0;$i -lt 3;$i++){$Textboxes.Add((Create-Textbox -xCoord 150 -yCoord (20+($Textboxes.Count * 40)) -xSize 400 -ySize 20))}
        for($i=0;$i -lt 2;$i++){$Textboxes.Add((Create-Textbox -xCoord 175 -yCoord (60+($Textboxes.Count * 40)) -xSize 375 -ySize 20))}
        <# Saving these just in case 14DEC2019
        $Textboxes.Add((Create-Textbox -xCoord 150 -yCoord (20+($Textboxes.Count * 40)) -xSize 400 -ySize 20))
        $Textboxes.Add((Create-Textbox -xCoord 150 -yCoord (20+($Textboxes.Count * 40)) -xSize 400 -ySize 20))
        $Textboxes.Add((Create-Textbox -xCoord 150 -yCoord (20+($Textboxes.Count * 40)) -xSize 400 -ySize 20))
        $Textboxes.Add((Create-Textbox -xCoord 175 -yCoord (60+($Textboxes.Count * 40)) -xSize 375 -ySize 20))
        $Textboxes.Add((Create-Textbox -xCoord 175 -yCoord (60+($Textboxes.Count * 40)) -xSize 375 -ySize 20))#>

        
        #Add the Labels and Textboxes to the add user form
        for($i=0;$i -lt $Labels.Count;$i++){$new_form.Controls.Add(($Labels[$i]))}
        for($i=0;$i -lt $Textboxes.Count;$i++){$new_form.Controls.Add(($Textboxes[$i]))}
        $new_form.ShowDialog()
    })

    

    $main_form.Controls.Add($ArrayOfButtons[0]) #can do it was $arr[0..1] is the form command in the create-button function is un-commented
    $main_form.Controls.Add($ArrayOfButtons[1])
    
    #Add new Users button
    $Button1 = New-Object System.Windows.Forms.Button
    $Button1.Location = New-Object System.Drawing.Size(10,10)
    $Button1.Size = New-Object System.Drawing.Size(330,50)
    $Font = New-Object System.Drawing.Font("Arial",10,[System.Drawing.FontStyle]::Bold) 
    $Button1.Font = $Font
    $Button1.Text = "Click to Add users"
    $Button1.Add_Click(
    {
        $new_form = New-Object System.Windows.Forms.Form
        $new_form.Size = New-Object System.Drawing.Size(500,500)
        $new_form.StartPosition = "CenterScreen"
        $new_form.FormBorderStyle = 'Fixed3D' 
        $new_form.Text = "New user"
        
        $Label1 = New-Object System.Windows.Forms.Label
        $Label1.Text = "User name: "
        $Label1.AutoSize = $true
        $Label1.Location  = New-Object System.Drawing.Point(10,20)
        $Label1.Size = New-Object System.Drawing.Size(100,30)
        $new_form.Controls.Add($Label1)

        $textBox1 = New-Object System.Windows.Forms.TextBox
        $textBox1.Location = New-Object System.Drawing.Point(120,20)
        $textBox1.Size = New-Object System.Drawing.Size(260,20)
        $textBox1.font = New-Object System.Drawing.Font("Arial",14,[System.Drawing.FontStyle]::Bold)
        $textBox1.Width = 300
        $new_form.Controls.Add($textBox1)

        $Label2 = New-Object System.Windows.Forms.Label
        $Label2.Text = "Full name: "
        $Label2.AutoSize = $true
        $Label2.Location  = New-Object System.Drawing.Point(10,50)
        $Label2.Size = New-Object System.Drawing.Size(100,30)
        $new_form.Controls.Add($Label2)

        $textBox2 = New-Object System.Windows.Forms.TextBox
        $textBox2.Location = New-Object System.Drawing.Point(120,50)
        $textBox2.Size = New-Object System.Drawing.Size(260,20)
        $new_form.Controls.Add($textBox2)

        $Label3 = New-Object System.Windows.Forms.Label
        $Label3.Text = "Description: "
        $Label3.AutoSize = $true
        $Label3.Location  = New-Object System.Drawing.Point(10,80)
        $Label3.Size = New-Object System.Drawing.Size(100,30)
        $new_form.Controls.Add($Label3)

        $textBox3 = New-Object System.Windows.Forms.TextBox
        $textBox3.Location = New-Object System.Drawing.Point(120,80)
        $textBox3.Size = New-Object System.Drawing.Size(260,20)
        $new_form.Controls.Add($textBox3)

        #Thin grey line
        $Label4 = New-Object System.Windows.Forms.Label
        $Label4.Text = ""
        #$Label4.AutoSize = $true
        $Label4.Location  = New-Object System.Drawing.Point(10,115)
        $Label4.Size = New-Object System.Drawing.Size(370,2)
        $Label4.BorderStyle = 'Fixed3D'
        $new_form.Controls.Add($Label4)

        $Label5 = New-Object System.Windows.Forms.Label
        $Label5.Text = "Password: "
        $Label5.AutoSize = $true
        $Label5.Location  = New-Object System.Drawing.Point(10,130)
        $Label5.Size = New-Object System.Drawing.Size(100,30)
        $new_form.Controls.Add($Label5)

        $textBox4 = New-Object System.Windows.Forms.TextBox
        $textBox4.Location = New-Object System.Drawing.Point(140,130)
        $textBox4.Size = New-Object System.Drawing.Size(240,20)
        $new_form.Controls.Add($textBox4)

        $Label6 = New-Object System.Windows.Forms.Label
        $Label6.Text = "Confirm Password: "
        $Label6.AutoSize = $true
        $Label6.Location  = New-Object System.Drawing.Point(10,160)
        $Label6.Size = New-Object System.Drawing.Size(100,30)
        $new_form.Controls.Add($Label6)

        $textBox5 = New-Object System.Windows.Forms.TextBox
        $textBox5.Location = New-Object System.Drawing.Point(140,160)
        $textBox5.Size = New-Object System.Drawing.Size(240,20)
        $new_form.Controls.Add($textBox5)


        $new_form.ShowDialog()
    })
    $main_form.Controls.Add($Button1)
    <#
    #Delete user button
    $Button2 = New-Object System.Windows.Forms.Button
    $Button2.Location = New-Object System.Drawing.Size(10,70)
    $Button2.Size = New-Object System.Drawing.Size(330,50)
    $Font = New-Object System.Drawing.Font("Arial",10,[System.Drawing.FontStyle]::Bold) 
    $Button2.Font = $Font
    $Button2.Text = "Click to Delete users"
    $Button2.Add_Click(
    {
        $new_form = New-Object System.Windows.Forms.Form
        $new_form.Size = New-Object System.Drawing.Size(400,400)
        $new_form.StartPosition = "CenterScreen"
        $new_form.FormBorderStyle = 'Fixed3D' 
        $new_form.Text = "Delete user"
        #insert code here
        $new_form.ShowDialog()
    })
    $main_form.Controls.Add($Button2)
    
    #Switch users from Admins to Standard Users
    #I want this to be a check box type of thing. Where all the users will be listed
    $Button3 = New-Object System.Windows.Forms.Button
    $Button3.Location = New-Object System.Drawing.Size(10,130)
    $Button3.Size = New-Object System.Drawing.Size(330, 50)
    $Font = New-Object System.Drawing.Font("Arial",10,[System.Drawing.FontStyle]::Bold) 
    $Button3.Font = $Font
    $Button3.Text = "Remove Admins"
    $Button3.Add_Click(
    {
        $new_form = New-Object System.Windows.Forms.Form
        $new_form.Size = New-Object System.Drawing.Size(400,400)
        $new_form.StartPosition = "CenterScreen"
        $new_form.FormBorderStyle = 'Fixed3D' 
        $new_form.Text = "Switch an Admin user to a standard user"
        #insert code here
        $new_form.ShowDialog()
    })
    $main_form.Controls.Add($Button3)
    
    #Remove audio and video button
    $Button4 = New-Object System.Windows.Forms.Button
    $Button4.Location = New-Object System.Drawing.Size(10,190)
    $Button4.Size = New-Object System.Drawing.Size(330,50)
    $Font = New-Object System.Drawing.Font("Arial",10,[System.Drawing.FontStyle]::Bold) 
    $Button4.Font = $Font
    $Button4.Text = "Remove audio and video"
    $Button4.Add_Click(
    {
        $new_form = New-Object System.Windows.Forms.Form
        $new_form.Size = New-Object System.Drawing.Size(400,400)
        $new_form.StartPosition = "CenterScreen"
        $new_form.FormBorderStyle = 'Fixed3D' 
        $new_form.Text = "Removes all audio and video media files"
        #insert code here
        $new_form.ShowDialog()
    })
    $main_form.Controls.Add($Button4)

    #Remove games and hacking tools
    $Button5 = New-Object System.Windows.Forms.Button
    $Button5.Location = New-Object System.Drawing.Size(10,250)
    $Button5.Size = New-Object System.Drawing.Size(330,50)
    $Font = New-Object System.Drawing.Font("Arial",10,[System.Drawing.FontStyle]::Bold) 
    $Button5.Font = $Font
    $Button5.Text = "Remove games"
    $Button5.Add_Click(
    {
        $new_form = New-Object System.Windows.Forms.Form
        $new_form.Size = New-Object System.Drawing.Size(400,400)
        $new_form.StartPosition = "CenterScreen"
        $new_form.FormBorderStyle = 'Fixed3D' 
        $new_form.Text = "Removes all games and hacking tools"
        #insert code here
        $new_form.ShowDialog()
    })
    $main_form.Controls.Add($Button5)
    
    #Set Password policies
    $Button6 = New-Object System.Windows.Forms.Button
    $Button6.Location = New-Object System.Drawing.Size(10,310)
    $Button6.Size = New-Object System.Drawing.Size(330,50)
    $Font = New-Object System.Drawing.Font("Arial",10,[System.Drawing.FontStyle]::Bold) 
    $Button6.Font = $Font
    $Button6.Text = "Set Password Policies"
    $Button6.Add_Click(
    {
        $new_form = New-Object System.Windows.Forms.Form
        $new_form.Size = New-Object System.Drawing.Size(400,400)
        $new_form.StartPosition = "CenterScreen"
        $new_form.FormBorderStyle = 'Fixed3D' 
        $new_form.Text = "Sets Password policies"
        #insert code here
        $new_form.ShowDialog()
    })
    $main_form.Controls.Add($Button6)
    
    #Set Lockout policies
    $Button7 = New-Object System.Windows.Forms.Button
    $Button7.Location = New-Object System.Drawing.Size(10,370)
    $Button7.Size = New-Object System.Drawing.Size(330,50)
    $Font = New-Object System.Drawing.Font("Arial",10,[System.Drawing.FontStyle]::Bold) 
    $Button7.Font = $Font
    $Button7.Text = "Set Lockout Policies"
    $Button7.Add_Click(
    {
        $new_form = New-Object System.Windows.Forms.Form
        $new_form.Size = New-Object System.Drawing.Size(400,400)
        $new_form.StartPosition = "CenterScreen"
        $new_form.FormBorderStyle = 'Fixed3D' 
        $new_form.Text = "Sets Lockout policies"
        #insert code here
        $new_form.ShowDialog()
    })
    $main_form.Controls.Add($Button7)

    #Turn off FTP and IIS
    $Button8 = New-Object System.Windows.Forms.Button
    $Button8.Location = New-Object System.Drawing.Size(10,430)
    $Button8.Size = New-Object System.Drawing.Size(330,50)
    $Font = New-Object System.Drawing.Font("Arial",10,[System.Drawing.FontStyle]::Bold) 
    $Button8.Font = $Font
    $Button8.Text = "Turn off FTP and IIS"
    $Button8.Add_Click(
    {
        $new_form = New-Object System.Windows.Forms.Form
        $new_form.Size = New-Object System.Drawing.Size(400,400)
        $new_form.StartPosition = "CenterScreen"
        $new_form.FormBorderStyle = 'Fixed3D' 
        $new_form.Text = "Turns off FTP and IIS"
        #insert code here
        $new_form.ShowDialog()
    })
    $main_form.Controls.Add($Button8)
    
    #Disable Remote Desktop
    $Button9 = New-Object System.Windows.Forms.Button
    $Button9.Location = New-Object System.Drawing.Size(10,490)
    $Button9.Size = New-Object System.Drawing.Size(330,50)
    $Font = New-Object System.Drawing.Font("Arial",10,[System.Drawing.FontStyle]::Bold) 
    $Button9.Font = $Font
    $Button9.Text = "Disable Remote Desktop"
    $Button9.Add_Click(
    {
        $new_form = New-Object System.Windows.Forms.Form
        $new_form.Size = New-Object System.Drawing.Size(400,400)
        $new_form.StartPosition = "CenterScreen"
        $new_form.FormBorderStyle = 'Fixed3D' 
        $new_form.Text = "Disables Remote Desktop"
        #insert code here
        $new_form.ShowDialog()
    })
    $main_form.Controls.Add($Button9)
    
    #Turn on firewall
    $Button10 = New-Object System.Windows.Forms.Button
    $Button10.Location = New-Object System.Drawing.Size(10,550)
    $Button10.Size = New-Object System.Drawing.Size(330,50)
    $Font = New-Object System.Drawing.Font("Arial",10,[System.Drawing.FontStyle]::Bold) 
    $Button10.Font = $Font
    $Button10.Text = "Enable Firewall"
    $Button10.Add_Click(
    {
        $new_form = New-Object System.Windows.Forms.Form
        $new_form.Size = New-Object System.Drawing.Size(400,400)
        $new_form.StartPosition = "CenterScreen"
        $new_form.FormBorderStyle = 'Fixed3D' 
        $new_form.Text = "Enables the Firewall"
        #insert code here
        $new_form.ShowDialog()
    })
    $main_form.Controls.Add($Button10)
    #>
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
    

    #Does it all
    $Button69 = New-Object System.Windows.Forms.Button
    $Button69.Location = New-Object System.Drawing.Size(970,740)
    $Button69.Size = New-Object System.Drawing.Size(210,23)
    $Font = New-Object System.Drawing.Font("Arial",10,[System.Drawing.FontStyle]::Bold) 
    $Button69.Font = $Font
    $Button69.Text = "Just do it all for me"
    $Button69.Add_Click(
    {
        $new_form = New-Object System.Windows.Forms.Form
        $new_form.Size = New-Object System.Drawing.Size(400,400)
        $new_form.StartPosition = "CenterScreen"
        $new_form.FormBorderStyle = 'Fixed3D' 
        $new_form.Text = "Just do it all for me"
        #insert code here
        $new_form.ShowDialog()
    })
    $main_form.Controls.Add($Button69)


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
    param($Text,$xCoord, $yCoord, $xSize, $ySize)
    $Label = New-Object System.Windows.Forms.Label
    $Label.Text = "$Text"
    $Label.AutoSize = $true
    $Label.Location  = New-Object System.Drawing.Point($xCoord,$yCoord)
    $Label.Size = New-Object System.Drawing.Size($xSize,$ySize)
    $Label.font = New-Object System.Drawing.Font("Arial",8,[System.Drawing.FontStyle]::Regular)
    $Label
    #$new_form.Controls.Add($Label)
}

Function Create-Textbox{
    param($xCoord, $yCoord, $xSize, $ySize)
    $textBox = New-Object System.Windows.Forms.TextBox
    $textBox.Location = New-Object System.Drawing.Point($xCoord,$yCoord)
    $textBox.Size = New-Object System.Drawing.Size($xSize,$ySize)
    $textBox.AutoSize = $true
    $textBox.font = New-Object System.Drawing.Font("Arial",14,[System.Drawing.FontStyle]::Regular)
    $textBox
    #$new_form.Controls.Add($textBox)
}

Test-GUI

#https://gallery.technet.microsoft.com/scriptcenter/How-to-build-a-form-in-7e343ba3
#https://theitbros.com/powershell-gui-for-scripts/
#https://mcpmag.com/articles/2016/06/09/display-gui-message-boxes-in-powershell.aspx
#https://docs.microsoft.com/en-us/powershell/scripting/samples/creating-a-custom-input-box?view=powershell-6
#https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.form?view=netframework-4.7.2
#https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms?redirectedfrom=MSDN&view=netframework-4.7.2

