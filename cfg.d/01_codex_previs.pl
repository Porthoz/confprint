
$c->{plugins}->{'Convert::Thumbnails'}->{params}->{audio_mp4} = {
	audio_codec => "libfdk_aac",
	audio_bitrate => "96k",
	audio_sampling => "44100",
	container => "mp4",
};
$c->{plugins}->{'Convert::Thumbnails'}->{params}->{video_mp4}= {
	audio_codec => "libfdk_aac",
	audio_bitrate => "96k",
	audio_sampling => "44100",
	video_codec => "libx264",
	video_frame_rate => "10.00",
	video_bitrate => "500k",
	container => "mp4",
};
