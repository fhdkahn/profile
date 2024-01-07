# Updating the HTML code to include the uploaded picture in the gallery section

# Path to the uploaded picture
picture_path = "/mnt/data/MY PIC PASSPORT SIZE.pic.jpg"

# Finding the gallery section in the HTML
gallery_section_start = final_html_code_with_instagram.find("<div class=\"gallery\">")
gallery_section_end = final_html_code_with_instagram.find("</div>", gallery_section_start)

# Preparing the updated gallery section with the picture
gallery_section_content = """
        <div class="gallery">
            <img src="{}" alt="Personal Photo">
        </div>
""".format(picture_path)

# Inserting the updated gallery section into the HTML
final_html_code_with_picture = (final_html_code_with_instagram[:gallery_section_end] + 
                                gallery_section_content + 
                                final_html_code_with_instagram[gallery_section_end:])

# Save the final updated HTML code to a new file
final_updated_with_picture_path = '/mnt/data/Final_Personal_Webpage_with_Picture.html'
with open(final_updated_with_picture_path, 'w') as file:
    file.write(final_html_code_with_picture)

final_updated_with_picture_path

