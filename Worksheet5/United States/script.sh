#! /usr/bin/bash
IFS=$'\n'
for line in $(cat "Global YouTube Statistics.csv"); do
    IFS=, read -r rank youtuber subscribers video_views category title uploads  country abbreviation channel_type video_views_rank country_rank channel_type_rank video_views_for_the_last_30_days lowest_monthly_earnings highest_monthly_earnnings lowest_yearly_earnings highest_yearly_earnings subscribers_for_last_30_days created_year created_month created_date gross_tertiary_education_enrollment population unemployment_rate urban_population latitude longitude <<< "$line"

    if [ "$country" == "United States" ]; then
	    if [ "$category" == "Music" ]||[ "$category" == "Entertainment" ]||[ "$category" == "Gaming" ]||[ "$category" == "Comedy" ]; then
        	echo "$rank,$youtuber,$subscribers,$video_views,$category,$title,$uploads,$country,$abbreviation,$channel_type,$video_views_rank,$country_rank,$channel_type_rank,$video_views_for_the_last_30_days,$lowest_monthly_earnings,$highest_monthly_earnings,$lowest_yearly_earnings,$highest_yearly_earnings,$subscribers_for_last_30_days,$created_year,$created_month,$created_date,$gross_tertiary_education_enrollment,$population,$unemployment_rate,$urban_population,$latitude,$longitude" >> "${category}.txt"
   	 	 fi
	fi
done
