/*
 * File: community_question_view.sql
 * File Created: Monday, 4th May 2020 1:19:19 pm
 * Author: Dyesse YUMBA
 * Last Modified: Monday, 4th May 2020 1:21:56 pm
 * Modified By: Dyesse YUMBA
 * -----
 * (c) 2020, WHO/AFRO/UCN/ESPEN
 */

/*
 * Variable to rename <%v_bf_lf_bsa_2_community_quest%>, <%bf_lf_bsa_2_community_quest%>
 */
CREATE view <%v_bf_lf_bsa_2_community_quest%>
AS
SELECT
  id,
  q_recorder_id,
  q_district_id,
  q_site_name,
  q_consent,
  q_sex,
  q_age_yrs,
  q_occupation,
  q_how_long_lived,
  q_bites_problems,
  q_bites_per_day,
  q_know_blackfly_season,
  q_blackfly_season,
  q_notes,
  q_end q_date
FROM <%bf_lf_bsa_2_community_quest%> q
