import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _roleTitle = "";
  String _organization = "";
  String _experienceType = "Internship";
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isCurrentRole = false;
  String _description = "";

  final List<String> _experienceTypes = [
    'Internship',
    'Full-time',
    'Part-time',
    'Organization',
    'Volunteer',
    'Competition',
  ];

  String _formatDate(DateTime? date) {
    if (date == null) return "Belum dipilih";
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  Future<void> _pickStartDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _startDate = picked;
        if (_endDate != null && _endDate!.isBefore(_startDate!)) {
          _endDate = null;
        }
      });
    }
  }

  Future<void> _pickEndDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? (_startDate ?? DateTime.now()),
      firstDate: _startDate ?? DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Add Experience Form'),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Posisi / Role ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Software Engineer Intern",
                    labelText: "Posisi / Peran",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _roleTitle = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Posisi / peran tidak boleh kosong!";
                    }
                    if (value.trim().length < 3) {
                      return "Posisi / peran minimal 3 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // === Perusahaan / Organisasi ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Fakultas Ilmu Komputer UI",
                    labelText: "Perusahaan / Organisasi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _organization = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama perusahaan/organisasi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Jenis Pengalaman ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Jenis Pengalaman",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _experienceType,
                  items: _experienceTypes
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _experienceType = newValue!;
                    });
                  },
                ),
              ),

              // === Tanggal Mulai (dengan validasi FormField) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FormField<DateTime>(
                  validator: (value) {
                    if (_startDate == null) {
                      return "Tanggal mulai wajib dipilih!";
                    }
                    return null;
                  },
                  builder: (state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () async {
                            await _pickStartDate();
                            state.didChange(_startDate);
                          },
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: "Tanggal Mulai",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              errorText: state.errorText,
                              suffixIcon: const Icon(Icons.calendar_today),
                            ),
                            child: Text(_formatDate(_startDate)),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // === Checkbox Masih Berlangsung ===
              CheckboxListTile(
                title: const Text("Saya masih aktif di posisi ini"),
                value: _isCurrentRole,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {
                  setState(() {
                    _isCurrentRole = value ?? false;
                    if (_isCurrentRole) {
                      _endDate = null;
                    }
                  });
                },
              ),

              // === Tanggal Selesai (jika tidak aktif) ===
              if (!_isCurrentRole)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormField<DateTime>(
                    validator: (value) {
                      if (!_isCurrentRole && _endDate == null) {
                        return "Tanggal selesai wajib dipilih jika sudah tidak aktif!";
                      }
                      if (_startDate != null &&
                          _endDate != null &&
                          _endDate!.isBefore(_startDate!)) {
                        return "Tanggal selesai tidak boleh sebelum tanggal mulai!";
                      }
                      return null;
                    },
                    builder: (state) {
                      return InkWell(
                        onTap: () async {
                          await _pickEndDate();
                          state.didChange(_endDate);
                        },
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: "Tanggal Selesai",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            errorText: state.errorText,
                            suffixIcon: const Icon(Icons.calendar_today),
                          ),
                          child: Text(_formatDate(_endDate)),
                        ),
                      );
                    },
                  ),
                ),

              // === Deskripsi Pengalaman ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Jelaskan tanggung jawab atau pencapaian utama...",
                    labelText: "Deskripsi Pengalaman",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi pengalaman tidak boleh kosong!";
                    }
                    if (value.trim().length < 10) {
                      return "Deskripsi minimal 10 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final String periodeText = _isCurrentRole
                            ? "${_formatDate(_startDate)} - Sekarang"
                            : "${_formatDate(_startDate)} - ${_formatDate(_endDate)}";

                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Pengalaman berhasil ditambahkan!'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Posisi: $_roleTitle'),
                                    Text('Organisasi: $_organization'),
                                    Text('Jenis: $_experienceType'),
                                    Text('Periode: $periodeText'),
                                    Text('Deskripsi: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                    setState(() {
                                      _roleTitle = "";
                                      _organization = "";
                                      _experienceType = "Internship";
                                      _startDate = null;
                                      _endDate = null;
                                      _isCurrentRole = false;
                                      _description = "";
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}