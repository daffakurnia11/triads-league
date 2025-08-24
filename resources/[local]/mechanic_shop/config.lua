Config = {}

-- Lokasi & setelan NPC
Config.Peds = {
  -- Kota
  {
    coords = vec4(-347.525269, -133.318680, 39.002197, 255.118103),
    model = 's_m_m_autoshop_01',
    scenario = 'WORLD_HUMAN_CLIPBOARD',
    useTarget = true,
    blip = { sprite = 402, color = 46, scale = 0.8, text = 'Toko Mekanik' }
  },
  -- Bandara
  {
    coords = vec4(-1148.149414, -1999.516479, 13.171387, 138.897629),
    model = 's_m_m_autoshop_01',                   
    scenario = 'WORLD_HUMAN_CLIPBOARD',            
    useTarget = true,                              
    blip = { sprite = 402, color = 46, scale = 0.8, text = 'Toko Mekanik' } 
  },
  -- Sandy Shores
  {
    coords = vec4(1171.252808, 2637.547363, 37.957520, 280.629913),
    model = 's_m_m_autoshop_01',                   
    scenario = 'WORLD_HUMAN_CLIPBOARD',            
    useTarget = true,                              
    blip = { sprite = 402, color = 46, scale = 0.8, text = 'Toko Mekanik' } 
  },
  -- Paleto
  {
    coords = vec4(111.375824, 6631.094727, 31.874756, 138.897629),
    model = 's_m_m_autoshop_01',                   
    scenario = 'WORLD_HUMAN_CLIPBOARD',            
    useTarget = true,                              
    blip = { sprite = 402, color = 46, scale = 0.8, text = 'Toko Mekanik' } 
  }
}

-- Daftar barang (label buat menu, itemName harus sudah ada di ox_inventory/items.lua)
Config.ShopItems = {
  { label = 'Toolkit (Full Repair)', item = 'toolkit',   price = 5000 },
  { label = 'Repair Kit (Engine)',   item = 'repairkit', price = 2500 },
  { label = 'Body Kit (Bodywork)',   item = 'bodykit',   price = 2500 },
  { label = 'Tire Kit (Tires)',      item = 'tirekit',   price = 1500 },
}
