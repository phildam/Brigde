class NumberNetworkPrefix
  def self.nigeria_phone_prefix
    {
      '0701' => 'Airtel', '0702' =>	'Smile', '07025' => 'Visafone',
      '07026' => 'Visafone', '07027' => 'MultiLinks', '07028' => 'Starcomms',
      '07029' => 'Starcomms', '0703' =>	'MTN', '0704' =>	'Visafone',
      '0705' =>	'Globacom', '0706' =>	'MTN', '0707' =>	'ZoomMobile','0708' => 'Airtel',
      '0709' => 'MultiLinks', '0802' => 'Airtel', '0803' => 'MTN', '0804' => 'Ntel',
      '0805' => 'Globacom',
      '0806' => 'MTN',
      '0807' => 'Globacom',
      '0808' => 'Airtel',
      '0809' => '9mobile',
      '0810' => 'MTN',
      '0811' => 'Globacom',
      '0812' => 'Airtel',
      '0813' => 'MTN',
      '0814' => 'MTN',
      '0815' => 'Globacom',
      '0816' => 'MTN',
      '0817' => '9mobile',
      '0818' => '9mobile',
      '0819' => 'Starcomms',
      '0909' => '9mobile',
      '0908' => '9mobile',
      '0902' => 'Airtel',
      '0903' => 'MTN',
      '0905' => 'Globacom',
      '0906' => 'MTN',
      '0907' => 'Airtel'
    }
  end

  def self.is_valid_nigerian_number?(sender)
    nigeria_phone_prefix.each do |key, value|
      return true if !!(sender =~ /#{key}(\d{4,})/ && sender.length == 11)
    end
    false
  end
end
