Function Test-Window
{
    [System.Windows.MessageBox]::Show('Hello','Header')
}
Function Test-GUI
{
    Add-Type -assembly System.Windows.Forms
    $main_form = New-Object System.Windows.Forms.Form
    $main_form.Size = New-Object System.Drawing.Size(1200,1200)
    $main_form.StartPosition = "CenterScreen" 
    $main_form.FormBorderStyle = 'Fixed3D' 
    $main_form.Text = "My Application"
    
    #Add new Users button
    $Button1 = New-Object System.Windows.Forms.Button
    $Button1.Location = New-Object System.Drawing.Size(10,10)
    $Button1.Size = New-Object System.Drawing.Size(200,25)
    $Font = New-Object System.Drawing.Font("Arial",12,[System.Drawing.FontStyle]::Bold) 
    $Button1.Font = $Font
    $Button1.Text = "Click to Add users"
    $Button1.Add_Click(
    {
        $new_form = New-Object System.Windows.Forms.Form
        $new_form.Size = New-Object System.Drawing.Size(400,400)
        $new_form.StartPosition = "CenterScreen" 
        $new_form.FormBorderStyle = 'Fixed3D' 
        $new_form.Text = "Add a new user"
        #insert code here
        $new_form.ShowDialog()
    })
    $main_form.Controls.Add($Button1)

    $Button2 = New-Object System.Windows.Forms.Button
    $Button2.Location = New-Object System.Drawing.Size(10,40)
    $Button2.Size = New-Object System.Drawing.Size(200,23)
    $Font = New-Object System.Drawing.Font("Arial",12,[System.Drawing.FontStyle]::Bold) 
    $Button2.Font = $Font
    $Button2.Text = "Click to Delete users"
    $main_form.Controls.Add($Button2)
    
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
    


    $main_form.ShowDialog()
} 
Test-GUI

#https://gallery.technet.microsoft.com/scriptcenter/How-to-build-a-form-in-7e343ba3
#https://theitbros.com/powershell-gui-for-scripts/
#https://mcpmag.com/articles/2016/06/09/display-gui-message-boxes-in-powershell.aspx

